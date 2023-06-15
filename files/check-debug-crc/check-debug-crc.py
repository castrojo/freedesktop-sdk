#!/usr/bin/python3

import sys
import zlib
import subprocess
import tempfile
import os.path
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--verbose", action="store_true")
parser.add_argument("sysroot")
args = parser.parse_args()

failed = False

for root, dirs, files in os.walk(args.sysroot):
    for f in files:
        obj = os.path.join(root, f)
        if os.path.islink(obj):
            continue

        with open(obj, "rb") as f:
            magic = f.read(4)
            if magic != b"\x7fELF":
                continue

        with tempfile.NamedTemporaryFile() as tmp:
            subprocess.run(["objcopy", "-O", "binary", "--set-section-flags", ".gnu_debuglink=alloc", "-j", ".gnu_debuglink", obj, tmp.name], check=True)
            data = tmp.read()

        if len(data) == 0:
            if args.verbose:
                print(f"{obj}: no debug")
            continue

        name, crc = data.split(b"\0", 1)

        crc = crc[len(crc)-4:]
        crc = int.from_bytes(crc, byteorder=sys.byteorder, signed=False)
        name = name.decode("utf-8")

        debugpath = os.path.join("/usr/lib/debug", os.path.relpath(os.path.dirname(obj), args.sysroot), name)
        full_debugpath = os.path.join(args.sysroot, os.path.relpath(debugpath, "/"))

        if not os.path.exists(full_debugpath):
            print(f"{obj}: no debug")
            continue

        with open(full_debugpath, "rb") as f:
            debugdata = f.read()
            calculated_crc = zlib.crc32(debugdata, 0)

        if calculated_crc != crc:
            print(f"{obj}: expected {crc:08x}, got {calculated_crc:08x}")
            failed = True
        elif args.verbose:
            print(f"{obj}: crc {crc:08x} correct")

if failed:
    sys.exit(1)
