# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import argparse
import logging
import os

from ruamel.yaml import YAML, YAMLError

yaml = YAML(typ="safe")

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
logger = logging.getLogger(__name__)


def load_ignore_list(path: str) -> set[str]:
    if os.path.isfile(path):
        with open(path, "r", encoding="utf-8") as f:
            data = yaml.load(f)
            if data is not None:
                return set(data)
    return set()


def extract_deps_from_object(
    obj,
    deps_data: set[str],
    dependency_keys: tuple[str, str, str],
    directory: str,
    parsed_files: set[str],
):
    def extract_deps(obj):
        if isinstance(obj, dict):
            if "(?)" in obj:
                conditional_obj = obj["(?)"]
                if isinstance(conditional_obj, dict):
                    for condition_result in conditional_obj.values():
                        extract_deps(condition_result)
                elif isinstance(conditional_obj, list):
                    for condition_item in conditional_obj:
                        if isinstance(condition_item, dict):
                            for condition_result in condition_item.values():
                                extract_deps(condition_result)

            if "(@)" in obj:
                includes = obj["(@)"]
                if isinstance(includes, list):
                    for include_path in includes:
                        if not include_path.endswith((".yml", ".yaml")):
                            continue
                        if include_path not in parsed_files and os.path.isfile(
                            include_path
                        ):
                            parsed_files.add(include_path)
                            try:
                                with open(include_path, "r", encoding="utf-8") as f:
                                    included_data = yaml.load(f)
                                    extract_deps_from_object(
                                        included_data,
                                        deps_data,
                                        dependency_keys,
                                        directory,
                                        parsed_files,
                                    )
                            except YAMLError as err:
                                logger.error(
                                    "Failed to parse included YAML file %s: %s",
                                    include_path,
                                    err,
                                )
                                raise

            for key, value in obj.items():
                if key in dependency_keys or key == "(>)":
                    process_dependency_value(value)
                elif key not in ("(?)", "(@)"):
                    extract_deps(value)

        elif isinstance(obj, list):
            for item in obj:
                extract_deps(item)

    def process_dependency_value(value):
        if isinstance(value, list):
            for dep in value:
                if isinstance(dep, str):
                    deps_data.add(dep)
                elif isinstance(dep, dict):
                    if "filename" in dep:
                        deps_data.add(dep["filename"])
                    else:
                        extract_deps(dep)
        elif isinstance(value, dict):
            extract_deps(value)

    extract_deps(obj)


def collect_deps(directory: str) -> set[str]:
    dependency_keys = ("build-depends", "depends", "runtime-depends")
    deps_data: set[str] = set()
    parsed_files = set()

    for root, _, files in os.walk(directory):
        for filename in files:
            if os.path.isfile(os.path.join(root, filename)) and filename.endswith(
                ".bst"
            ):
                filepath = os.path.join(root, filename)
                if filepath in parsed_files:
                    continue
                parsed_files.add(filepath)
                try:
                    with open(filepath, "r", encoding="utf-8") as f:
                        data = yaml.load(f)
                        extract_deps_from_object(
                            data, deps_data, dependency_keys, directory, parsed_files
                        )
                except YAMLError as err:
                    logger.error("Failed to parse YAML for %s: %s", filename, err)
                    raise

    return {
        entry.split("/")[-1]
        for entry in deps_data
        if entry.startswith("components/") and entry.endswith(".bst")
    }


def load_components_stack(path: str) -> set[str]:
    with open(path, "r", encoding="utf-8") as f:
        data = yaml.load(f)

    return {
        entry.split("/")[-1]
        for entry in data.get("depends", [])
        if entry.endswith(".bst")
    }


def load_elements(directory: str) -> set[str]:
    return {
        file.split("/")[-1]
        for root, _, files in os.walk(directory)
        for file in files
        if file.endswith(".bst")
    }


def calculate_missing_from_components_stack(
    elements_dir: str, components_stack: str, ignore_data: str | None = None
) -> set[str]:
    dir_elems = load_elements(elements_dir)
    stack_elems = load_components_stack(components_stack)
    all_deps = collect_deps(elements_dir)
    ignore_json = set()

    if any(not x for x in (dir_elems, stack_elems, all_deps)):
        raise ValueError(
            "One or more of 'dir_elems', 'stack_elems', 'all_deps' are empty. "
            "Something went wrong while parsing."
        )

    if ignore_data is not None:
        ignore_json = load_ignore_list(ignore_data)

    if ignore_json:
        logger.info("Loaded ignore list: %s", ignore_json)

    missing = dir_elems - stack_elems

    return {elem for elem in (missing - ignore_json) if elem not in all_deps}


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Find missing elements from the components stack"
    )
    parser.add_argument(
        "--elements-dir",
        default="elements/components",
        help="Directory containing all elements",
    )
    parser.add_argument(
        "--components-stack",
        default="elements/components.bst",
        help="Path to the components stack",
    )
    parser.add_argument(
        "--ignore-file",
        default=None,
        help="Path to YAML file containing a list of elements to ignore",
    )

    args = parser.parse_args()
    missing = calculate_missing_from_components_stack(
        elements_dir=args.elements_dir,
        components_stack=args.components_stack,
        ignore_data=args.ignore_file,
    )

    if missing:
        logger.error(
            "Found elements that are not in components.bst or in any other element: %s",
            sorted(missing),
        )
        logger.info(
            "These are probably not being built in CI and not getting updated. "
            "If this is intentional, please add them in "
            "'tests/ignore-missing-from-components.stack.yaml' with an explanation."
        )
        return 1
    else:
        logger.info("No missing elements found")
        return 0


if __name__ == "__main__":
    raise SystemExit(main())
