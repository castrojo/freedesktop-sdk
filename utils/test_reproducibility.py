#!/usr/bin/env python3
from typing import List, Optional

import argparse
import subprocess
import os
import sys
import tempfile
import multiprocessing

from yattag import Doc, indent


class ElementInfo:
    """ Represents a line of parsed information from bst show """

    def __init__(self, name, ref=None, status=None):
        self.name = name  # the element.bst
        self.ref = ref  # the identification hash
        self.status = status  # cached or not cached


class BuildstreamConfiguration:
    """ Represents the user specified configuration for buildstream """

    def __init__(self):
        bst_binary_call = os.environ.get("BST", "bst")
        self.bst_call = bst_binary_call.split(" ")


def bst_build(
        bst_config: BuildstreamConfiguration,
        element_info: ElementInfo,
        remove_internet_access: bool,
        dependency_kind: str,
        max_jobs: Optional[int]=None
):
    """Builds a single element without network connection
    to make sure we are not downloading from a artifacts server."""
    bst_call = bst_config.bst_call.copy()
    if max_jobs:
        bst_call.extend(["--max-jobs", str(max_jobs)])
    bst_call.extend(["build", element_info.name])
    bst_call.extend(["--deps", dependency_kind])

    if remove_internet_access:
        bst_call.extend(["--ignore-project-artifact-remotes"])
    print("BST BUILD RUNNING:", bst_call)
    subprocess.run(bst_call, check=True)


def bst_remove_artifact_cache(
        bst_config: BuildstreamConfiguration,
        element_info: ElementInfo,
        dependency_kind: str
) -> bool:
    """ Remove a build artifact from the local cache """
    bst_call = bst_config.bst_call.copy()
    bst_call.extend(["artifact", "delete"])
    bst_call.append(element_info.name)
    bst_call.extend(["--deps", dependency_kind])
    subprocess.run(bst_call, check=True)


def bst_checkout_files_to(
        bst_config: BuildstreamConfiguration, element_name, output_folder: str
) -> None:
    """Move a build artifact to a specific folder.
    The element should have been build already"""

    bst_call = bst_config.bst_call.copy()
    bst_call.extend(
        [
            "artifact",
            "checkout",
            "--hardlinks",
            "--deps",
            "none",
            "--no-integrate",
            element_name,
            "--directory",
            output_folder,
        ]
    )

    print("BST CHECKOUT RUNNING:", bst_call, file=sys.stderr)
    subprocess.run(bst_call, check=True)


def bst_show_extract_result(output) -> List[ElementInfo]:
    """ Parses the output of the bst show command and returns the matches, if exists. """
    result = []
    for line in output.decode("utf-8").splitlines():
        if len(line) == 0:
            continue
        # sdk.bst,ea449744661b5e444a6806cb5f534,waiting
        words = line.split(",")
        assert len(words) == 3

        result.append(ElementInfo(name=words[0], ref=words[1], status=words[2]))

    return result


# Returns a list of build elements, hash, and status
# we use this to compare later on with a second build.
def bst_show(
    bst_config: BuildstreamConfiguration,
    element_infos: List[ElementInfo],
    dependency_kind: str,
) -> List[ElementInfo]:
    """Gather all of the results of the build, name and ref,
    so we can build all of them again to compare.
    dependency kind is"""

    # Has to run with colors off, otherwise parsing output will break
    bst_call = [x for x in bst_config.bst_call if x != "--colors"]
    bst_call.extend(
        [
            "show",
            "--deps",
            dependency_kind,
            "--format",
            "%{name},%{full-key},%{state}",
        ]
    )
    bst_call.extend(element_info.name for element_info in element_infos)

    print("BST SHOW:", bst_call, file=sys.stderr)

    proc = subprocess.run(bst_call, check=True, capture_output=True)
    result = bst_show_extract_result(proc.stdout)

    return result


def is_reproducible(
        element_name: str, folder: str, subfolder_a: str, subfolder_b: str, output_dir: str
):
    """ runs diffoscope on two different folders and saves the result """

    tool = "diffoscope"
    folder_a = os.path.join(folder, subfolder_a)
    folder_b = os.path.join(folder, subfolder_b)

    diffoscope_cmd = [
        tool,
        # saves generated html on the output dir
        f"--html-dir={output_dir}",
        # I don't really like this option as I can't fine tune to ignore what
        # I want (timestamps of generated files), and it ignores useful stuff
        # like file permissions. but if we don't ignore timestamps all builds
        # will be non-reproducible. a patch for diffoscope is on the way to support
        # a list of metadatas that should be ignored.
        "--exclude-directory-metadata=recursive",
        folder_a,
        folder_b,
    ]

    print(f"DIFFOSCOPE for {element_name}: ", diffoscope_cmd)

    proc = subprocess.run(diffoscope_cmd)

    return proc.returncode == 0


def restore_initial_state(
        bst_config: BuildstreamConfiguration, element_info: ElementInfo
):
    """
    We want to build as many elements against remote cached artifacts as possible
    so we first wipe everything, then download what we can fallbacking to building
    if necessary. We will also fetch sources for everything so that does not have
    to be done later.
    """
    bst_remove_artifact_cache(bst_config=bst_config, element_info=element_info, dependency_kind="all")

    bst_build(
        bst_config=bst_config,
        element_info=element_info,
        remove_internet_access=False,
        dependency_kind="all",
    )


def is_single_project_reproducible(
        bst_config: BuildstreamConfiguration, element_info: ElementInfo, output_dir: str
) -> bool:
    """ verify if a single element is reproducible """

    with tempfile.TemporaryDirectory(dir=".") as folder:
        # Checkout all files from the original build and store in a folder.
        print("Starting the rebuild to verify reproducibility.")

        bst_checkout_files_to(
            bst_config=bst_config,
            element_name=element_info.name,
            output_folder=os.path.join(folder, "a"),
        )

        bst_remove_artifact_cache(
            bst_config=bst_config,
            element_info=element_info,
            dependency_kind="none",
        )

        bst_build(
            bst_config=bst_config,
            element_info=element_info,
            remove_internet_access=True,
            dependency_kind="none",
            max_jobs=multiprocessing.cpu_count()
        )
        bst_checkout_files_to(
            bst_config=bst_config,
            element_name=element_info.name,
            output_folder=os.path.join(folder, "b"),
        )

        # compare everything and store the result.
        dirname = f"{output_dir}/{element_info.name}"

        return is_reproducible(
            element_name=element_info.name,
            folder=folder,
            subfolder_a="a",
            subfolder_b="b",
            output_dir=dirname,
        )


def bst_check_reproducibility_v2(
        bst_config: BuildstreamConfiguration, element_name: str, output_dir: str
) -> List[str]:
    """First checks if all the dependencies of element are reproducible, then
    checks if element is reproducible"""
    element_info = ElementInfo(element_name)
    restore_initial_state(bst_config, element_info)

    deps = bst_show(
        bst_config=bst_config, element_infos=[element_info], dependency_kind="all"
    )

    results = {
        "non_reproducible": [],
        "reproducible" : []
    }

    # Try to build all dependencies.
    for element_info in reversed(deps):
        if not is_single_project_reproducible(
                bst_config=bst_config, element_info=element_info, output_dir=output_dir
        ):
            results["non_reproducible"].append(element_info.name)
        else:
            results["reproducible"].append(element_info.name)

    return results


def write_html_report(results, output_dir: str, output_filename: str) -> None:
    doc, tag, text = Doc().tagtext()

    with tag("html"):
        with tag("body"):
            with tag("table", border=1):
                with tag("tr"):
                    with tag("td"):
                        text("Element Name")
                    with tag("td"):
                        text("Build Status")
                    with tag("td"):
                        text("Error log")

                with tag("tr"):
                    with tag("td", colspan=3):
                        text("Non Reproducible Elements")

                for line in results["non_reproducible"]:
                    with tag("tr"):
                        with tag("td"):
                            text(line)
                        with tag("td"):
                            text("Failure")
                        with tag("td"):
                            dirname = output_dir + f"/{line}/index.html"
                            with tag("a", href=dirname):
                                text("index.html")

                with tag("tr"):
                    with tag("td", colspan=3):
                        text("Reproducible Elements")

                for line in results["reproducible"]:
                    with tag("tr"):
                        with tag("td"):
                            text(line)
                        with tag("td"):
                            text("Success")
                        with tag("td"):
                            text(" - ")

    with open(output_filename, "w", encoding="utf-8") as file:
        result = indent(doc.getvalue())
        file.write(result)


def handle_results(results, output_dir: str) -> bool:
    """ Get the list of results, writes the resulting file, and prints useful information to the user """

    # Write the report first
    write_html_report(results, output_dir, "reproducibility_results.html")

    # Generate some overall stdout and report a successful exit status
    # only if everything was found to be reproducible
    print("")
    if len(results["non_reproducible"]) == 0:
        print("Project is reproducible.")
        return True

    print("Project is not reproducible, please check the results")
    print("in reproducibility_results.txt and for a more detailed")
    print(f"output, see the folder {output_dir} specified in the command")

    return False


def main():
    """ start of the application """

    print("Checking reproducibility")
    parser = argparse.ArgumentParser(
        description="Test a buildstream project for reproducibility"
    )

    parser.add_argument(
        "element",
        help="The name of the element we test the reproducibility, including it's dependencies.",
    )
    parser.add_argument("output", help="The result directory")

    args = parser.parse_args()
    element = args.element
    output_dir = args.output

    bst_config = BuildstreamConfiguration()

    results = bst_check_reproducibility_v2(
        bst_config=bst_config, element_name=element, output_dir=output_dir
    )

    if handle_results(results=results, output_dir=output_dir):
        return 0
    return 1


if __name__ == "__main__":
    sys.exit(main())
