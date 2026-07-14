#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import argparse
import fnmatch
import glob
import json
import logging
import os
import re
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
logger = logging.getLogger(__name__)


def is_ldd_up() -> bool:
    try:
        output = subprocess.run(["ldd", "--version"], capture_output=True, text=True)
    except FileNotFoundError:
        return False
    else:
        return output.returncode == 0


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


def parse_undefined_symbols(output: str) -> list[str]:
    undefined = []
    pattern = r"undefined symbol:\s+(\S+)"

    for line in output.splitlines():
        match = re.search(pattern, line)
        if match:
            undefined.append(match.group(1))

    return undefined


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
        logger.error("Failed to determine triplet for arch: %s", m_arch)
        return None

    if libdir and os.path.exists(libdir):
        return libdir
    else:
        logger.error("libdir does not exist: %s", libdir)
        return None


def should_check_symbols(file: str, libdir: str) -> bool:
    file_basename = os.path.basename(file)
    file_dir = os.path.dirname(file)

    if file_dir != libdir:
        return False

    return bool(file_basename.endswith(".so"))


def check_elf_file(file: str, libdir: str) -> tuple[str, dict | None]:
    if not (should_check(file) and os.access(file, os.X_OK)):
        return (os.path.basename(file), None)

    file_basename = os.path.basename(file)
    file_result = {}

    check_symbols = should_check_symbols(file, libdir)
    try:
        ldd_cmd = ["ldd", "-r", file] if check_symbols else ["ldd", file]
        output = subprocess.run(ldd_cmd, capture_output=True, text=True)
    except subprocess.CalledProcessError as err:
        raise RuntimeError(
            f"Error processing {file_basename}: {err.stderr.strip()}"
        ) from err

    if "not a dynamic executable" in output.stderr.strip():
        return (file_basename, None)

    missing = {
        line.split("=>")[0].strip()
        for line in output.stdout.splitlines()
        if "not found" in line
    }
    if missing:
        file_result["missing_libs"] = list(missing)

    if check_symbols:
        undefined_syms = parse_undefined_symbols(output.stdout)
        undefined_syms.extend(parse_undefined_symbols(output.stderr))

        if undefined_syms:
            file_result["undefined_symbols"] = list(set(undefined_syms))

    return (file_basename, file_result if file_result else None)


def find_missing_libs(root: str, libdir: str) -> dict[str, dict[str, list[str] | bool]]:
    results: dict[str, dict[str, list[str] | bool]] = {}

    files_to_check = list(glob.iglob(f"{root}/**", recursive=True))
    max_workers = min(32, (os.cpu_count() or 1) * 2)

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {
            executor.submit(check_elf_file, file, libdir): file
            for file in files_to_check
        }

        for future in as_completed(futures):
            file_basename, file_result = future.result()
            if file_result:
                results[file_basename] = file_result

    return results


def matches_pattern(lib_name: str, pattern: str) -> bool:
    return fnmatch.fnmatch(lib_name, pattern)


def filter_ignored_items(
    result: dict[str, dict[str, list[str] | bool]],
    ignore_map: dict[str, dict[str, list[str] | bool]],
) -> dict[str, dict[str, list[str] | bool]]:
    """
    Format:
    {
        "binary_name": {
            "ignore-missing": ["lib1.so", "lib2.so.*"],
            "ignore-undefined-syms": ["symbol1", "symbol2", "_Z*"]
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
            ignore_patterns = ignore_config.get("ignore-missing", [])

            ignored_libs: list[str] = []
            non_ignored_libs: list[str] = []

            for lib in issues["missing_libs"]:
                if any(matches_pattern(lib, pattern) for pattern in ignore_patterns):
                    ignored_libs.append(lib)
                else:
                    non_ignored_libs.append(lib)

            if ignored_libs:
                logger.info(
                    "Ignoring missing libs for %s: %s",
                    file_name,
                    ", ".join(ignored_libs),
                )

            if non_ignored_libs:
                filtered_issues["missing_libs"] = non_ignored_libs

        if "undefined_symbols" in issues:
            ignore_patterns = ignore_config.get("ignore-undefined-syms", [])

            ignored_syms: list[str] = []
            non_ignored_syms: list[str] = []

            for sym in issues["undefined_symbols"]:
                if any(matches_pattern(sym, pattern) for pattern in ignore_patterns):
                    ignored_syms.append(sym)
                else:
                    non_ignored_syms.append(sym)

            if ignored_syms:
                logger.info(
                    "Ignoring undefined symbols for %s: %s",
                    file_name,
                    ", ".join(ignored_syms),
                )

            if non_ignored_syms:
                filtered_issues["undefined_symbols"] = non_ignored_syms

        if filtered_issues:
            filtered_result[file_name] = filtered_issues

    return filtered_result


def main() -> int:
    if not is_ldd_up():
        logger.error("ldd is not available or not working")
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
        print(json.dumps(result, indent=4))
        return 1
    else:
        logger.info("No ELFs found with missing dependencies or undefined symbols")
        return 0


if __name__ == "__main__":
    raise SystemExit(main())
