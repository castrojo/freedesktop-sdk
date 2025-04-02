#!/usr/bin/env python3

import argparse
import glob
import json
import logging
import os
import subprocess

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")


def is_ldd_up() -> bool:
    try:
        output = subprocess.run(
            ["ldd", "--version"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        return output.returncode == 0
    except FileNotFoundError:
        return False


def should_check(fname: str) -> bool:
    if not os.path.isfile(fname):
        return False
    try:
        with open(fname, "br") as f:
            return f.read(4) == b"\x7fELF"
    except OSError:
        return False


def load_ignore_list(path: str):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def find_missing_libs(root: str) -> dict[str, list[str]]:
    missing_libs = {}
    for file in glob.iglob(f"{root}/**", recursive=True):
        if not (should_check(file) and os.access(file, os.X_OK)):
            continue
        file_basename = os.path.basename(file)
        try:
            output = subprocess.run(
                ["ldd", file], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
            )

            if "not a dynamic executable" in output.stderr.strip():
                continue

            missing = {
                line.split("=>")[0].strip()
                for line in output.stdout.splitlines()
                if "not found" in line
            }
            if missing:
                missing_libs[file_basename] = list(missing)
        except subprocess.CalledProcessError as err:
            raise RuntimeError(
                f"Error processing {file_basename}: {err.stderr.strip()}"
            ) from err
    return missing_libs


def filter_ignored_items(
    result: dict[str, list[str]], ignore_map: dict[str, list[str]]
) -> dict[str, list[str]]:
    filtered_result = {}

    for file_name, missing_libs in result.items():
        if file_name in ignore_map and isinstance(ignore_map[file_name], list):
            ignored_libs = []
            non_ignored_libs = []

            for lib in missing_libs:
                if lib in ignore_map[file_name]:
                    ignored_libs.append(lib)
                else:
                    non_ignored_libs.append(lib)

            if ignored_libs:
                logging.info(
                    "Ignoring libs for %s: %s", file_name, ", ".join(ignored_libs)
                )

            if non_ignored_libs:
                filtered_result[file_name] = non_ignored_libs
        else:
            filtered_result[file_name] = missing_libs

    return filtered_result


def main() -> int:
    if not is_ldd_up():
        logging.error("ldd is not available or not working")
        return 1

    parser = argparse.ArgumentParser(
        description="Find ELF files with missing dependencies"
    )
    parser.add_argument(
        "--ignore-file", type=str, help="Path to JSON file with ignore list"
    )
    parser.add_argument(
        "--sysroot",
        type=str,
        default="/usr",
        help="Sysroot to check, defaults to '/usr'",
    )
    args = parser.parse_args()

    ignore_map = {}
    if args.ignore_file:
        ignore_map = load_ignore_list(args.ignore_file)

    result = find_missing_libs(args.sysroot)

    if ignore_map:
        result = filter_ignored_items(result, ignore_map)

    if result:
        print(json.dumps(result, indent=4))
        return 1
    else:
        logging.info("No ELFs found with missing dependencies")
        return 0


if __name__ == "__main__":
    raise SystemExit(main())
