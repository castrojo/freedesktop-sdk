#!/usr/bin/env python3

"""This is a simple rewrite of the reproducibility test

Missing from Buildstream:
- Remove Downloadable Artifacts
    Apparently buildstream 2 will support removing artifacts, but
    buildstream 1.5+ still lacks this possibility.

- Disable Artifacts Server
    Currently we need to run buildstream without access to
    internet via a LD_PRELOAD hack. We can't
    expect that this will work everywhere.
"""

from typing import List

import argparse
import subprocess
import os
import sys
import tempfile
import yaml

from yattag import Doc, indent


# pull and fetch have similar semantics, that are not really that
# different to make clear that we are talking about artifacts or
# sources, both just download something from the internet.
# perhaps:
# bst pull --type artifacts --deps all TARGET
# bst pull --type sources --deps all TARGET


class ElementInfo:
    """ Represents a line of parsed information from bst show """

    def __init__(self, name, ref, status):
        self.name = name  # the element.bst
        self.ref = ref  # the identification hash
        self.status = status  # cached or not cached


class BuildstreamConfiguration:
    """ Represents the user specified configuration for buildstream """

    def __init__(self):
        bst_binary_call = os.environ.get("BST", "bst")
        found = False
        config = None

        self.bst_call = bst_binary_call.split(" ")
        self.bst_call_no_colors = [p for p in self.bst_call if p != "--colors"]

        if "--config" in bst_binary_call:
            config_index = self.bst_call.index("--config") + 1
            config = self.bst_call[config_index]
            found = True
        elif " -c " in bst_binary_call:
            config_index = self.bst_call.index("-c") + 1
            config = self.bst_call[config_index]
            found = True

        xdg_config_home = os.environ.get(
            "XDG_CONFIG_HOME", os.path.expanduser("~/.config")
        )
        if not found and os.path.exists(
                os.path.join(xdg_config_home, "buildstream1.conf")
        ):
            config = os.path.join(xdg_config_home, "buildstream1.conf")
            found = True

        if not found and os.path.exists(
                os.path.join(xdg_config_home, "buildstream.conf")
        ):
            config = os.path.join(xdg_config_home, "buildstream.conf")
            found = True

        if not found:
            self._default_cache_folder()
        else:
            with open(config, "r", encoding="utf-8") as config_file:
                parsed_config = yaml.load(config_file.read(), Loader=yaml.SafeLoader)
                if "artifactdir" in parsed_config:
                    self.cache_folder = os.path.join(
                        parsed_config["artifactdir"], "cas/refs"
                    )
                else:
                    self._default_cache_folder()

    def _default_cache_folder(self):
        bst_cache_folder = "buildstream/artifacts/cas/refs"
        xdg_folder = os.environ.get("XDG_CACHE_HOME", os.path.expanduser("~/.cache"))
        self.cache_folder = os.path.join(xdg_folder, bst_cache_folder)


def bst_pull_artifacts(
        bst_config: BuildstreamConfiguration, element_names: [str]
) -> bool:
    """ Runs bst pull for all the dependencies on the targets """
    bst_call = bst_config.bst_call.copy()
    bst_call.extend(["pull"])
    bst_call.extend(element_names)

    print("BST PULL RUNNING:", bst_call)
    ret = subprocess.call(bst_call)

    return ret == 0


def bst_fetch_sources(
        bst_config: BuildstreamConfiguration, element_names: [str]
) -> bool:
    """ Run bst fetch for all dependencies on the target """

    bst_call = bst_config.bst_call.copy()
    bst_call.extend(["fetch"])
    bst_call.extend(element_names)

    print("BST FETCH RUNNING:", bst_call)
    ret = subprocess.call(bst_call)

    return ret == 0


def is_exe(fpath: bytes) -> bool:
    return os.path.isfile(fpath) and os.access(fpath, os.X_OK)


def has_executable(program: str) -> bool:
    fpath, _ = os.path.split(program)
    if fpath:
        if is_exe(program):
            return True
    else:
        for path in os.environ["PATH"].split(os.pathsep):
            exe_file = os.path.join(path, program)
            if is_exe(exe_file):
                return True

    return False


def bst_build_specific(
        bst_config: BuildstreamConfiguration,
        element_name: str,
        remove_internet_access: bool,
):
    """Builds a single element without network connection
    to make sure we are not downloading from a artifacts server."""
    # FIXME: change this to bst build --no-cache target as soon as it's supported.
    # do not hack around forbid-network.

    bst_call = bst_config.bst_call.copy()
    bst_call.extend(["build", element_name])

    if remove_internet_access:
        # FIXME: Remove this line. it blocks access to the internet for this
        # script, but the proper way to do this is to have buildstream to
        # not allow artifact cache access for a specific element using a
        # command line flag.

        forbid_network_call = ["forbid-network"]
        forbid_network_call.extend(bst_call)

        print("BST BUILD RUNNING:", forbid_network_call)
        subprocess.call(forbid_network_call)
    else:
        print("BST BUILD RUNNING:", bst_call)
        subprocess.call(bst_call)


def bst_remove_all_artifacts_from_list(
        bst_config: BuildstreamConfiguration, element_list: List[ElementInfo]
) -> None:
    """Removes all build artifacts from the artifact list
    making sure that we are in a clean build state"""
    for original_element in element_list:
        bst_remove_artifact_cache(
            bst_config=bst_config,
            element_name=original_element.name,
            element_ref=original_element.ref,
        )


def bst_remove_artifact_cache(
        bst_config: BuildstreamConfiguration, element_name: str, element_ref: str
) -> bool:
    """ Remove a build artifact from the local cache """
    # FIXME, discomment this when buildstream supports deleting artifacts.
    # ret = subprocess.call(["bst", "artifact", "delete", target])
    # or better, we can remove this call completely by using a patch to
    # buildstream forbidding it to use the cache for a build.

    for root, _, files in os.walk(bst_config.cache_folder):
        for name in files:
            if name == element_ref:
                print("found cache, removing.")
                fullpath = os.path.join(root, name)
                os.remove(fullpath)
                return True

    print(f"No cache found for element {element_name} ref {element_ref}.")
    return False


def bst_checkout_files_to(
        bst_config: BuildstreamConfiguration, element_name, output_folder: str
) -> None:
    """Move a build artifact to a specific folder.
    The element should have been build already"""

    bst_call = bst_config.bst_call.copy()
    bst_call.extend(
        [
            "checkout",
            "--deps",
            "none",
            "--no-integrate",
            element_name,
            output_folder,
        ]
    )

    print("BST CHECKOUT RUNNING:", bst_call)
    ret = subprocess.call(bst_call)

    if ret != 0:
        print("ERROR: Could not copy files to temporary folder, aborting.")
        sys.exit(1)


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
        bst_config: BuildstreamConfiguration, targets: [str], dependency_kind: str
) -> List[ElementInfo]:
    """Gather all of the results of the build, name and ref,
    so we can build all of them again to compare.
    dependency kind is"""

    result = []

    try:
        # The bst show --deps build excludes the element itself,
        # so we need to run once with --deps build and another time
        # with --deps none

        bst_call = bst_config.bst_call_no_colors.copy()
        bst_call.extend(
            [
                "show",
                "--deps",
                dependency_kind,
                "--format",
                "%{name},%{full-key},%{state}",
            ]
        )
        bst_call.extend(targets)

        print("BST SHOW:", bst_call)

        output = subprocess.check_output(bst_call)
        result = bst_show_extract_result(output)

    except subprocess.CalledProcessError as exception:
        print(exception)
        sys.exit(1)

    return result


def bst_fetch_required_sources(
        bst_config: BuildstreamConfiguration, element_name: str
):
    seen = set([element_name])
    queue = [element_name]
    required = [element_name]

    while queue:
        result = bst_show(bst_config, queue, 'build')
        queue = []
        for elt in result:
            if elt.name in seen:
                continue
            seen.add(elt.name)
            if elt.status == 'cached':
                continue
            queue.append(elt.name)
            if elt.status == 'fetch needed':
                required.append(elt.name)

    bst_fetch_sources(bst_config=bst_config, element_names=required)

    return required


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

    result = subprocess.call(diffoscope_cmd)

    return result == 0


def handle_artifact_status(
        bst_config: BuildstreamConfiguration, element_infos: List[ElementInfo]
) -> bool:
    """Not a good name, this function tries to remove the cache, redownload it
    and then verify if the status equals cached, returning a boolean value.
    """
    for build_dep in element_infos:
        bst_remove_artifact_cache(
            bst_config=bst_config,
            element_name=build_dep.name,
            element_ref=build_dep.ref,
        )

    element_names = [element.name for element in element_infos]
    bst_pull_artifacts(bst_config=bst_config, element_names=element_names)

    # A Comment from Valentin on the MR for this, but it's important
    # as explanation on why is this here:

    pull_result = bst_show(
        bst_config=bst_config, targets=element_names, dependency_kind="none"
    )

    if len(pull_result) == 0:
        return True

    for result in pull_result:
        if result.status != "cached":
            return True

    return False


def is_single_project_reproducible(
        bst_config: BuildstreamConfiguration, element_info: ElementInfo, output_dir: str
) -> bool:
    """ verify if a single element is reproducible """
    rebuild_fallback = False

    build_deps = bst_show(
        bst_config=bst_config, targets=[element_info.name], dependency_kind="build"
    )

    if handle_artifact_status(
            bst_config=bst_config, element_infos=[*build_deps, element_info]
    ):
        rebuild_fallback = True

    if rebuild_fallback:
        print(
            f"Warning: rebuilding element {element_info.name} because it was not in the remote cache."
        )
        bst_build_specific(
            bst_config=bst_config,
            element_name=element_info.name,
            remove_internet_access=False,
        )
    else:
        print("No need to rebuild, found in cache.")

    with tempfile.TemporaryDirectory() as folder:
        # Checkout all files from the original build and store in a folder.
        print("Starting the rebuild to verify reproducibility.")

        bst_checkout_files_to(
            bst_config=bst_config,
            element_name=element_info.name,
            output_folder=os.path.join(folder, "a"),
        )

        bst_remove_artifact_cache(
            bst_config=bst_config,
            element_name=element_info.name,
            element_ref=element_info.ref,
        )

        bst_fetch_required_sources(
            bst_config=bst_config,
            element_name=element_info.name,
        )

        bst_build_specific(
            bst_config=bst_config,
            element_name=element_info.name,
            remove_internet_access=True,
        )
        bst_checkout_files_to(
            bst_config=bst_config,
            element_name=element_info.name,
            output_folder=os.path.join(folder, "b"),
        )

        # compare everything and store the result.
        dirname = output_dir + f"/{element_info.name}"

        return is_reproducible(
            element_name=element_info.name,
            folder=folder,
            subfolder_a="a",
            subfolder_b="b",
            output_dir=dirname,
        )


def bst_check_reproducibility_v2(
        bst_config: BuildstreamConfiguration, element: str, output_dir: str
) -> List[str]:
    """First checks if all the dependencies of element are reproducible, then
    checks if element is reproducible"""

    runtime_deps = bst_show(
        bst_config=bst_config, targets=[element], dependency_kind="run"
    )
    results = {
        "non_reproducible": [],
        "reproducible" : []
    }

    # Try to build all dependencies.
    for runtime_dep in runtime_deps:
        if not is_single_project_reproducible(
                bst_config=bst_config, element_info=runtime_dep, output_dir=output_dir
        ):
            results["non_reproducible"].append(runtime_dep.name)
        else:
            results["reproducible"].append(runtime_dep.name)

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
        bst_config=bst_config, element=element, output_dir=output_dir
    )

    if handle_results(results=results, output_dir=output_dir):
        return 0
    return 1


if __name__ == "__main__":
    sys.exit(main())
