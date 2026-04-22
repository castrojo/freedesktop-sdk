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

import sys

import system_test

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

if __name__ == "__main__":
    result = system_test.main(
        "Test that a minimal-system VM image works as expected", DIALOGS
    )
    sys.exit(result)
