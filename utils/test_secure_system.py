#!/usr/bin/python3
# Copyright (C) 2017-2026 Codethink Limited
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

"""test_secure_system.py: Boots a secure disk image in QEMU and tests it."""

import sys

import system_test

DIALOGS = {
    "systemd-firstboot": [
        "Please enter the new root password",
        "root",
        "Please enter the new root password again",
        "root",
        "localhost login:",
        "root",
        "Password:",
        "root",
        "#",
        "grep -q usrhash= /proc/cmdline && echo usrhash-ok=$?",
        "usrhash-ok=0",
        "grep -q lockdown=confidentiality /proc/cmdline && echo lockdown-ok=$?",
        "lockdown-ok=0",
        "findmnt -no FSTYPE /usr",
        "squashfs",
        "systemctl poweroff",
        "Power down",
    ],
    "root-login": [
        "localhost login:",
        "root",
        "Password:",
        "root",
        "#",
        "grep -q usrhash= /proc/cmdline && echo usrhash-ok=$?",
        "usrhash-ok=0",
        "grep -q lockdown=confidentiality /proc/cmdline && echo lockdown-ok=$?",
        "lockdown-ok=0",
        "findmnt -no FSTYPE /usr",
        "squashfs",
        "systemctl poweroff",
        "Power down",
    ],
}

result = system_test.main(
    "Test that a minimal secure VM image works as expected", DIALOGS
)
sys.exit(result)
