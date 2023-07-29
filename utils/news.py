#!/usr/bin/env python3
"""Helper script for preparing and publishing release."""

import argparse
from contextlib import contextmanager
import fileinput
import os
import re
import shlex
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
    joined = "\n".join(f"  * {line}" for line in log_lines)
    return re.sub(r"elements/.*/(.*?)(?:-sources?)?.(?:bst|yml)", r"\1", joined)


def maybe_push(push, git_dir, message, remote, stable_branch, news_branch):
    push_args = [
        "push",
        "-o",
        "merge_request.create",
        "-o",
        f"merge_request.target={stable_branch}",
        "-o",
        f"merge_request.title=Draft: {message}",
        remote,
        news_branch,
    ]

    if push:
        run_git(
            push_args,
            cwd=git_dir,
        )
    else:
        print("To submit an MR for the release branch run:")
        print("    ", shlex.join(["git", *push_args]))


def prepare(args):
    news_branch = f"news/{args.new_version}"
    stable_branch = f"{args.remote}/{args.stable_branch}"

    run_git(["fetch", "--prune", args.remote])
    with git_workdir(news_branch, stable_branch) as git_dir:
        previous_tag = run_git(
            ["describe", "--abbrev=0", stable_branch],
            cwd=git_dir,
        )
        changelog = generate_changelog(previous_tag, git_dir)
        with fileinput.FileInput(os.path.join(git_dir, "NEWS"), inplace=True) as f:
            for line in f:
                if f.lineno() == 1:
                    line += f"\n{args.new_version}:\n{changelog}\n"
                print(line, end="")
        message = f"NEWS: Update for {args.new_version}"
        run_git(
            ["commit", "-m", message, "NEWS"],
            cwd=git_dir,
        )
        maybe_push(
            args.push, git_dir, message, args.remote, args.stable_branch, news_branch
        )


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    subparsers = parser.add_subparsers()

    prepare_parser = subparsers.add_parser("prepare", help="Prepare a release")
    prepare_parser.add_argument(
        "-r",
        "--remote",
        default="origin",
        help="The configured remote to perform git operations against",
    )
    prepare_parser.add_argument(
        "-p",
        "--push",
        action="store_true",
        help="Automatically push and submit the merge request",
    )
    prepare_parser.add_argument(
        "stable_branch",
        help="The branch to prepare a release for, e.g. 'release/22.08'",
    )
    prepare_parser.add_argument("new_version", help="The new release tag/version")
    prepare_parser.set_defaults(func=prepare)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
