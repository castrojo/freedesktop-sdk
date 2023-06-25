#!/usr/bin/env python3
"""TODO"""

import argparse
from contextlib import contextmanager
import os.path
import subprocess
from tempfile import TemporaryDirectory


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-r", "--remote", default="origin", help="TODO")
    parser.add_argument("stable_branch", help="TODO: E.g. 'release/22.08'")
    parser.add_argument("new_version", help="TODO")
    return parser.parse_args()


def run_git(cmd, **kwargs):
    return subprocess.check_output(["git", *cmd], text=True, **kwargs)


@contextmanager
def git_workdir(new_branch, stable_branch):
    with TemporaryDirectory() as tmpdir:
        try:
            run_git(
                ["worktree", "add", "-b", new_branch, tmpdir, stable_branch], cwd=SCRIPT_DIR
            )
            yield tmpdir
        finally:
            run_git(["worktree", "prune"], cwd=SCRIPT_DIR)


def main():
    args = parse_args()
    news_branch = f"news/{args.new_version}"
    print(f"Creating branch '{news_branch}'")

    run_git(["fetch", args.remote])
    with git_workdir(news_branch, f"{args.remote}/{args.stable_branch}") as git_dir:
        previous_tag = subprocess.check_output(["git", "describe", "--abbrev=0", f"{args.remote}/{args.stable_branch}"], text=True, cwd=git_dir).strip()
        run_git(["log", "--no-merges", "--format=  * %s", f"{previous_tag}.."], cwd=git_dir)
        # git log --format="%s" freedesktop-sdk-22.08.5.. | sed 's|elements/components/\(.*\).bst|\1|'


if __name__ == "__main__":
    main()
