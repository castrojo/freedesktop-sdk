#!/usr/bin/env python3
"""TODO"""

import argparse
from contextlib import contextmanager
import os.path
import subprocess
import sys
from tempfile import TemporaryDirectory


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-r", "--remote", default="origin")
    parser.add_argument("stable_version", help="E.g. '22.08'") # perhaps just have this be 22.08, 21.08
    # TODO: regex check \d\d.\d\d for above?
    parser.add_argument("new_version", nargs="?")
    # override guessed version. Maybe semver or similar package?
    return parser.parse_args()


def run_git(cmd, **kwargs):
    return subprocess.run(["git", *cmd], check=True)


@contextmanager
def git_workdir(release_branch):
    with TemporaryDirectory() as tmpdir:
    try:
        run_git(["worktree", "add", tmpdir, release_branch], cwd=SCRIPT_DIR)
        yield tmpdir
    finally:
        subprocess.run(["git", "worktree", "prune"], cwd=SCRIPT_DIR)


def main():
    args = parse_args()

    news_branch = "news/fdsdk-22.08."

    with git_workdir(args. as git_dir:
        _, url = porcelain.get_remote_repo(repo, args.remote)
        client, path = get_transport_and_path(url)
        def wants(refs):
            wanted = set()
            for name in refs:
                if name.startswith(b"refs/tags/freedesktop-sdk-22.08"):
                    wanted.add(refs[name])
            branch_ref = f"refs/heads/release/{args.stable_version}".encode()
            if branch_ref in refs:
                wanted.add(refs[branch_ref])
            return wanted
        client.fetch(path, repo, determine_wants=wants)

    origin_branch = f"{args.remote}/release/{args.stable_version}"
    previous_tag = subprocess.check_output(["git", "describe", "--abbrev=0", origin_branch], text=True)
    print(previous_tag)
    #subprocess.run(["git", "log", "--format='%s'", f"{previous_tag}..{origin_branch}"])
    # git log --format="%s" freedesktop-sdk-22.08.5.. | sed 's|elements/components/\(.*\).bst|\1|'


if __name__ == "__main__":
    main()
