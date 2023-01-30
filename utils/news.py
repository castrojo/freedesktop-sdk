#!/usr/bin/env python3

import subprocess
import sys


def main():
    release_branch = sys.argv[1]
    origin_branch = origin_branch if release_branch[:7] == "origin/" else f"origin/{release_branch}"
    subprocess.run(["git", "remote", "update"])
    subprocess.run(["git", "describe", "--abbrev=0", origin_branch])
    subprocess.run(["git", "log", "--format='%s'", f"{previous_tag}..{origin_branch}"])
    # git log --format="%s" freedesktop-sdk-22.08.5.. | sed 's|elements/components/\(.*\).bst|\1|'


if __name__ == "__main__":
    main()
