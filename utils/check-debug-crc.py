#!/usr/bin/python3

import argparse
import json
import os.path
import subprocess
import sys
import tempfile
import zlib


def load_ignore_list(path: str):
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8") as f:
            return set(json.load(f))
    return set()


parser = argparse.ArgumentParser()
parser.add_argument("--verbose", action="store_true")
parser.add_argument(
    "--ignore-file",
    default="missing-debug-data-allowlist.json",
    help="JSON allowlist for ELFs with missing debug data",
)
parser.add_argument("sysroot")
args = parser.parse_args()

failed = False
no_debug_objs: set[str] = set()

for root, _, files in os.walk(args.sysroot):
    for f in files:
        obj = os.path.join(root, f)
        if os.path.islink(obj):
            continue

        with open(obj, "rb") as f:
            magic = f.read(4)
            if magic != b"\x7fELF":
                continue

        with tempfile.NamedTemporaryFile() as tmp:
            subprocess.run(
                [
                    "objcopy",
                    "-O",
                    "binary",
                    "--set-section-flags",
                    ".gnu_debuglink=alloc",
                    "-j",
                    ".gnu_debuglink",
                    obj,
                    tmp.name,
                ],
                check=True,
            )
            data = tmp.read()

        if len(data) == 0:
            if args.verbose:
                print(f"{obj}: no debug")
            continue

        name, crc = data.split(b"\0", 1)

        crc = crc[len(crc) - 4 :]
        crc = int.from_bytes(crc, byteorder=sys.byteorder, signed=False)
        name = name.decode("utf-8")

        debugpath = os.path.join(
            "/usr/lib/debug", os.path.relpath(os.path.dirname(obj), args.sysroot), name
        )
        full_debugpath = os.path.join(args.sysroot, os.path.relpath(debugpath, "/"))

        if not os.path.exists(full_debugpath):
            print(f"{obj}: no debug")
            no_debug_objs.add(os.path.basename(obj))

        if os.path.exists(full_debugpath):
            with open(full_debugpath, "rb") as f:
                debugdata = f.read()
                calculated_crc = zlib.crc32(debugdata, 0)

            if calculated_crc != crc:
                print(f"{obj}: expected {crc:08x}, got {calculated_crc:08x}")
                failed = True
            elif args.verbose:
                print(f"{obj}: crc {crc:08x} correct")


ignore_list = load_ignore_list(args.ignore_file)
if ignore_list:
    print(f"Found ignore list: {ignore_list}")
    no_debug_objs -= ignore_list

if no_debug_objs:
    print(f"ELFs with no debug data: {no_debug_objs}")
    failed = True

if failed:
    sys.exit(1)
