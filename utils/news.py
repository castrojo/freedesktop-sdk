#!/usr/bin/env python3
"""Helper script for preparing and publishing release."""

import argparse
from contextlib import contextmanager
import fileinput
import os
import subprocess
import sys
from tempfile import TemporaryDirectory

import gitlab


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))


def run_git(cmd, **kwargs):
    return subprocess.check_output(["git", *cmd], text=True, **kwargs).rstrip()


@contextmanager
def git_workdir(new_branch, stable_branch):
    try:
        with TemporaryDirectory() as tmpdir:
            run_git(
                ["worktree", "add", "-b", new_branch, tmpdir, stable_branch],
                cwd=SCRIPT_DIR,
            )
            yield tmpdir
    finally:
        run_git(["worktree", "prune"], cwd=SCRIPT_DIR)


def generate_changelog(previous_tag, git_dir):
    print(f"Generating changelog for changes since {previous_tag}")
    log_lines = run_git(
        ["log", "--no-merges", "--format=%s", f"{previous_tag}.."],
        cwd=git_dir,
    ).splitlines()
    return "\n".join(f"  * {line}" for line in log_lines)


def apply_log_filters(changelog, filters):
    with open(
    pass


def prepare(args):
    news_branch = f"news/{args.new_version}"
    print(f"Creating branch '{news_branch}'")

    run_git(["fetch", "--prune", args.remote])
    with git_workdir(news_branch, f"{args.remote}/{args.stable_branch}") as git_dir:
        previous_tag = run_git(
            ["describe", "--abbrev=0", f"{args.remote}/{args.stable_branch}"],
            cwd=git_dir,
        )
        rawlog = generate_changelog(previous_tag, git_dir)
        changelog = apply_log_filters(changelog, [])
        with fileinput.FileInput(os.path.join(git_dir, "NEWS"), inplace=True) as f:
            for line in f:
                if f.lineno() == 1:
                    line += f"\n{args.new_version}:\n{changelog}\n"
                print(line, end="")
        run_git(
            ["commit", "-m", f"NEWS: Update for {args.new_version}", "NEWS"],
            cwd=git_dir,
        )

        # git log --format="%s" freedesktop-sdk-22.08.5.. | sed 's|elements/components/\(.*\).bst|\1|'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers()

    prepare_parser = subparsers.add_parser("prepare", help="Prepare a release")
    prepare_parser.add_argument("-r", "--remote", default="origin", help="TODO")
    prepare_parser.add_argument("stable_branch", help="TODO: E.g. 'release/22.08'")
    prepare_parser.add_argument("new_version", help="TODO")
    prepare_parser.set_defaults(func=prepare)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
