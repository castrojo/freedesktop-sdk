#!/usr/bin/python3
# Copyright (C) 2017 Codethink Limited
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

"""test_minimal_system.py: Boots a disk image in QEMU and tests that it works."""

import argparse
import asyncio
import asyncio.subprocess
import logging
import os
import signal
import subprocess
import sys

QEMU = "qemu-system-x86_64"
QEMU_EXTRA_ARGS = ["-m", "256"]

FAILURE_TIMEOUT = 300  # seconds
BUFFER_SIZE = 80  # how many characters to read at once

DIALOGS = {
    "minimal": ["Started '/init' script from initramfs.", "\nuname -a", "Linux"],
    "systemd-firstboot": [
        "-- Press any key to proceed --",
        "",
        "Please enter system locale name or number",
        "1",
        "Please enter system message locale name or number",
        "",
        "Please enter timezone name or number",
        "1",
        "Please enter a new root password",
        "root",
        "Please enter new root password again",
        "root",
        "localhost login",
        "root",
        "Password",
        "root",
        "#",
        "uname -a",
        "Linux",
        "systemctl poweroff",
        "Power down",
    ],
    "root-login": [
        "localhost login:",
        "root",
        "Password:",
        "root",
        "#",
        "uname -a",
        "#",
        "systemctl poweroff",
        "Power down",
    ],
}


def build_qemu_image_command(args):
    kvm_args = []
    try:
        out = subprocess.check_output([QEMU, "-accel", "help"], encoding="ascii")
        if "kvm" in out.splitlines():
            kvm_args = ["-enable-kvm"]
    except subprocess.CalledProcessError:
        sys.stderr.write("Cannot query qemu for accelerator. Not using it.\n")

    return (
        [QEMU, "-drive", f"file={args.sda},format=raw", "-nographic"]
        + QEMU_EXTRA_ARGS
        + kvm_args
    )


def build_command(args):
    return args.command.split()


def argument_parser():
    parser = argparse.ArgumentParser(
        description="Test that a minimal-system VM image works as expected"
    )
    parser.add_argument(
        "--dialog",
        dest="dialog",
        default="root-login",
        help=f"dialog to follow (valid values {DIALOGS.keys()}, default: root-login)",
    )

    subparsers = parser.add_subparsers()
    image_parser = subparsers.add_parser("image")
    image_parser.set_defaults(get_command=build_qemu_image_command)
    image_parser.add_argument("sda", help="Path to disk image file")

    command_parser = subparsers.add_parser("command")
    command_parser.set_defaults(get_command=build_command)
    command_parser.add_argument("command", help="Command to run")

    return parser


async def await_line(stream, marker):
    """Read from 'stream' until a line appears contains 'marker'."""
    marker = marker.encode("utf-8")
    buf = b""

    while not stream.at_eof():
        chunk = await asyncio.wait_for(stream.read(BUFFER_SIZE), FAILURE_TIMEOUT)
        sys.stdout.buffer.write(chunk)
        buf += chunk
        lines = buf.split(b"\n")
        for line in lines:
            if marker in line:
                try:
                    return line.decode("utf-8")
                except UnicodeDecodeError:
                    break
        buf = lines[-1]


async def run_test(command, dialog):
    dialog = DIALOGS[dialog]

    success = False

    try:
        logging.debug("Starting process: %s", command)
        process = await asyncio.create_subprocess_exec(
            *command,
            stdin=asyncio.subprocess.PIPE,
            stdout=asyncio.subprocess.PIPE,
            start_new_session=True,
        )

        while dialog:
            prompt = await await_line(process.stdout, dialog.pop(0))

            assert prompt is not None
            if dialog:
                process.stdin.write(dialog.pop(0).encode("ascii") + b"\n")

        print("Test successful")
        success = True
    finally:
        try:
            os.killpg(os.getpgid(process.pid), signal.SIGKILL)
        except ProcessLookupError:
            pass

        await process.communicate()
        await process.wait()

    return success


def main():
    args = argument_parser().parse_args()

    command = args.get_command(args)

    task = asyncio.wait_for(run_test(command, args.dialog), FAILURE_TIMEOUT)

    try:
        result = asyncio.run(task)
    except asyncio.TimeoutError:
        print("VM was considered inresponsive and test was aborted", file=sys.stderr)
        return 1

    if result:
        return 0
    return 1


result = main()
sys.exit(result)
