#!/usr/bin/env python3

import argparse
import glob
import json
import logging
import os
import re
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


def has_undefined_symbols(output: str) -> bool:
    pattern = r"undefined symbol:"
    return bool(re.search(pattern, output))


def get_libdir(sysroot: str) -> str | None:
    libdir = None
    m_arch = os.uname().machine
    libdir_map = {
        "x86_64": "x86_64-linux-gnu",
        "i686": "i386-linux-gnu",
        "aarch64": "aarch64-linux-gnu",
        "ppc64le": "powerpc64le-linux-gnu",
        "ppc64": "powerpc64-linux-gnu",
        "riscv64": "riscv64-linux-gnu",
        "loongarch64": "loongarch64-linux-gnu",
    }
    triplet = libdir_map.get(m_arch)
    if triplet:
        libdir = os.path.join(sysroot, "lib", triplet)
    else:
        logging.error("Failed to determine triplet for arch: %s", m_arch)
        return None

    if libdir and os.path.exists(libdir):
        return libdir
    else:
        logging.error("libdir does not exist: %s", libdir)
        return None


def should_check_symbols(file: str, libdir: str) -> bool:
    file_basename = os.path.basename(file)
    file_dir = os.path.dirname(file)

    if file_dir != libdir:
        return False

    return bool(file_basename.endswith(".so"))


def find_missing_libs(root: str, libdir: str) -> dict[str, dict[str, list[str] | bool]]:
    results: dict[str, dict[str, list[str] | bool]] = {}

    for file in glob.iglob(f"{root}/**", recursive=True):
        if not (should_check(file) and os.access(file, os.X_OK)):
            continue

        file_basename = os.path.basename(file)
        file_result = {}

        try:
            check_symbols = should_check_symbols(file, libdir)
            ldd_cmd = ["ldd", "-r", file] if check_symbols else ["ldd", file]

            output = subprocess.run(
                ldd_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
            )

            if "not a dynamic executable" in output.stderr.strip():
                continue

            missing = {
                line.split("=>")[0].strip()
                for line in output.stdout.splitlines()
                if "not found" in line
            }
            if missing:
                file_result["missing_libs"] = list(missing)

            if check_symbols:
                has_undefined = has_undefined_symbols(
                    output.stdout
                ) or has_undefined_symbols(output.stderr)

                if has_undefined:
                    file_result["has_undefined_symbols"] = True

            if file_result:
                results[file_basename] = file_result

        except subprocess.CalledProcessError as err:
            raise RuntimeError(
                f"Error processing {file_basename}: {err.stderr.strip()}"
            ) from err

    return results


def filter_ignored_items(
    result: dict[str, dict[str, list[str] | bool]],
    ignore_map: dict[str, dict[str, list[str] | bool]],
) -> dict[str, dict[str, list[str] | bool]]:
    """
    Format:
    {
        "binary_name": {
            "ignore-missing": ["lib1.so", "lib2.so.*"],
            "ignore-undefined-syms": true
        }
    }
    """
    filtered_result: dict[str, dict[str, list[str] | bool]] = {}

    for file_name, issues in result.items():
        if file_name not in ignore_map:
            filtered_result[file_name] = issues
            continue

        ignore_config = ignore_map[file_name]
        filtered_issues = {}

        if "missing_libs" in issues:
            ignore_map_ignored_libs = ignore_config.get("ignore-missing", [])
            non_ignored_libs = [
                lib
                for lib in issues["missing_libs"]
                if lib not in ignore_map_ignored_libs
            ]

            if ignore_map_ignored_libs:
                ignored_libs = [
                    lib
                    for lib in issues["missing_libs"]
                    if lib in ignore_map_ignored_libs
                ]
                if ignored_libs:
                    logging.info(
                        "Ignoring missing libs for %s: %s",
                        file_name,
                        ", ".join(ignored_libs),
                    )

            if non_ignored_libs:
                filtered_issues["missing_libs"] = non_ignored_libs

        if "has_undefined_symbols" in issues:
            if not ignore_config.get("ignore-undefined-syms", False):
                filtered_issues["has_undefined_symbols"] = True
            else:
                logging.info("Ignoring undefined symbols for %s", file_name)

        if filtered_issues:
            filtered_result[file_name] = filtered_issues

    return filtered_result


def main() -> int:
    if not is_ldd_up():
        logging.error("ldd is not available or not working")
        return 1

    parser = argparse.ArgumentParser(
        description="Find ELF files with missing dependencies and undefined symbols"
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

    libdir = get_libdir(args.sysroot)
    if not libdir:
        return 1

    result = find_missing_libs(args.sysroot, libdir)

    if ignore_map:
        result = filter_ignored_items(result, ignore_map)

    if result:
        print(json.dumps(result, indent=4))  # noqa: T201
        return 1
    else:
        logging.info("No ELFs found with missing dependencies or undefined symbols")
        return 0


if __name__ == "__main__":
    raise SystemExit(main())
