#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import re
import subprocess

REMOTE = "https://gitlab.com/freedesktop-sdk/freedesktop-sdk.git"


def latest_release():
    args = [
        "git",
        "ls-remote",
        "--sort=-version:refname",
        REMOTE,
        "refs/heads/release/*",
    ]
    output = subprocess.check_output(args, text=True)
    first_line = output.splitlines()[0]
    _, _, refname = first_line.strip().partition("\t")
    match = re.search(r"^refs/heads/release/(.*)$", refname)
    assert match
    return match.group(1)


if __name__ == "__main__":
    print(latest_release())
