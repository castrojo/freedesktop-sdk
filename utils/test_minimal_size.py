#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

# Copyright (C) 2026 Codethink Limited
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

"""
test_minimal_size.py: Ensures that the minimal EFI image size is less than
a given limit.
"""

import os
import sys
from pathlib import Path

DIR_SIZE_REPORT_FILE = os.getenv("DIR_SIZE_REPORT_FILE", "dir_sizes_B.tsv")
MAX_SIZE_EFI_VM = os.getenv("MAX_SIZE_EFI_VM", "1_800_000_000")  # Default 1.8 GB
OVERSIZE_ERR_MSG = """
Filesystem size test failed, please either reduce the image size, or increase the
environment variable MAX_SIZE_EFI_VM to a new agreed limit in bytes.
"""


def main():
    print(f"Filesystem size test, MAX_SIZE_EFI_VM = {MAX_SIZE_EFI_VM} B")
    # Using glob as path to report varies by architecture
    dir_size_files = Path(".").glob(f"**/{DIR_SIZE_REPORT_FILE}")
    if (dir_sizes_file := next(dir_size_files, None)) is not None:
        # Last line of `du` output is the total size of the filesystem
        dir_sizes = dir_sizes_file.read_text().splitlines()
        if len(dir_sizes) > 0:
            dir_size = dir_sizes[-1]
            print(f"Filesystem size: {dir_size}")

            try:
                size_bytes = int(dir_size.split()[0])
                max_size_bytes = int(MAX_SIZE_EFI_VM)
                if size_bytes <= max_size_bytes:
                    print(f"FS size {size_bytes} B <= maximum size {max_size_bytes} B")
                    print("Filesystem size test passed.")
                    sys.exit(os.EX_OK)
                else:
                    print(f"FS size {size_bytes} B > maximum size {max_size_bytes} B")
                    print(OVERSIZE_ERR_MSG)
                    sys.exit(os.EX_DATAERR)

            except ValueError:
                print("Error: file sizes not convertable to integers", file=sys.stderr)
                sys.exit(os.EX_DATAERR)

        else:
            print(f"Error: {DIR_SIZE_REPORT_FILE} was empty", file=sys.stderr)
            sys.exit(os.EX_DATAERR)

    else:
        print(f"Error: {DIR_SIZE_REPORT_FILE} not found", file=sys.stderr)
        sys.exit(os.EX_NOINPUT)


if __name__ == "__main__":
    main()
