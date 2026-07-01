#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import argparse
import fnmatch
import glob
import json
import logging
import os

logger = logging.getLogger(__name__)


def list_pc_names(pkgconfdir: str) -> set[str]:
    return {
        os.path.splitext(os.path.basename(pc_file))[0]
        for pc_file in glob.glob(os.path.join(pkgconfdir, "*.pc"))
    }


def list_libraries(libdir: str, pc_names: set[str]) -> dict[str, str]:
    libs = {}
    for f in os.listdir(libdir):
        if f.endswith(".so"):
            continue

        filepath = os.path.join(libdir, f)
        if os.path.islink(filepath):
            continue

        if f.startswith("lib") and ".so" in f:
            lib_name = f.split(".so")[0]
            if lib_name in pc_names:
                libs[f] = lib_name
            elif lib_name[3:] in pc_names:
                libs[f] = lib_name[3:]
    return libs


def load_ignore_list(ignore_file: str) -> list[str]:
    if not ignore_file or not os.path.exists(ignore_file):
        return []

    with open(ignore_file, encoding="utf-8") as f:
        data = json.load(f)
        if isinstance(data, list):
            return data
        elif isinstance(data, dict):
            return list(data.keys())
        return []


def save_libraries(libdir: str, pkgconfdir: str, output: str) -> bool:
    if os.path.exists(output):
        logger.error("Output file already exists: %s", output)
        return False

    pc_names = list_pc_names(pkgconfdir)

    if not pc_names:
        logger.error("No pkgconfig files were found")
        return False

    libs = list_libraries(libdir, pc_names)

    if not libs:
        logger.error("No libraries were found")
        return False

    with open(output, "w", encoding="utf-8") as f:
        json.dump(libs, f, indent=4)

    logger.info("Saved %d libraries to %s", len(libs), output)
    return True


def check_libraries(input_file: str, libdir: str, ignore_file: str) -> bool:
    if not os.path.exists(input_file):
        logger.error("File not found: %s", input_file)
        return False

    with open(input_file, encoding="utf-8") as f:
        saved_libs = json.load(f)

    if not saved_libs:
        logger.error("No libraries in saved file")
        return False

    ignore_patterns = load_ignore_list(ignore_file)
    current_libs = set(os.listdir(libdir))

    def is_ignored(lib: str) -> bool:
        return any(fnmatch.fnmatch(lib, pattern) for pattern in ignore_patterns)

    missing = [
        (lib, pc)
        for lib, pc in saved_libs.items()
        if lib not in current_libs and not is_ignored(lib)
    ]

    if missing:
        logger.error("%d libraries are missing:", len(missing))
        for lib, pc in missing:
            print(f"  {lib} ({pc}.pc)")
        return False
    logger.info("All libraries are still installed")
    return True


def main() -> int:
    logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")

    parser = argparse.ArgumentParser(description="Library tracker")
    parser.add_argument("--sysroot", default="/", help="Sysroot (default: /)")
    parser.add_argument(
        "--libdir", help="Library directory (default: usr/lib/$triplet)"
    )
    parser.add_argument(
        "--list",
        action="store_true",
        help="List libraries with .pc files and save to JSON",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Check if listed libraries are still installed",
    )
    parser.add_argument(
        "--file", default="libs.json", help="Path to JSON file (default: libs.json)"
    )
    parser.add_argument(
        "--ignore", help="Path to JSON file with libraries to ignore when checking"
    )
    args = parser.parse_args()

    sysroot = os.path.abspath(args.sysroot)

    if not os.path.exists(sysroot):
        logger.error("Sysroot does not exist: %s", sysroot)
        return 1

    if not args.libdir:
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
        if not triplet:
            logger.error("Failed to determine triplet for machine arch %s", m_arch)
            return 1
        args.libdir = f"usr/lib/{triplet}"

    libdir = os.path.join(sysroot, args.libdir.lstrip("/"))

    if not os.path.exists(libdir):
        logger.error("Libdir does not exist: %s", libdir)
        return 1

    pkgconfigdir = os.path.join(libdir, "pkgconfig")

    if args.list:
        if not os.path.exists(pkgconfigdir):
            logger.error("Pkgconfig directory does not exist: %s", pkgconfigdir)
            return 1
        if not save_libraries(libdir, pkgconfigdir, args.file):
            return 1
    elif args.check:
        if not check_libraries(args.file, libdir, args.ignore):
            return 1
    else:
        parser.print_help()
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
