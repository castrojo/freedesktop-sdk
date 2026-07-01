#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import sys

if __name__ == "__main__":
    version = sys.argv[1]
    print(
        f"org.freedesktop.Platform {version} is no longer receiving "
        "fixes and security updates. "
        "Please update to a supported runtime version."
    )
