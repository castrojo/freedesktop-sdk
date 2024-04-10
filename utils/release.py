#!/usr/bin/env python3
"""Helper script for preparing and publishing release."""

import argparse
from contextlib import contextmanager
import fileinput
from pathlib import Path
import re
import shlex
import subprocess
import sys
from tempfile import TemporaryDirectory

import gitlab


SCRIPT_DIR = Path(__file__).resolve().parent
FD_SDK_ID = 4339844


def run_git(cmd, **kwargs):
    return subprocess.check_output(["git", *cmd], text=True, **kwargs).rstrip()


@contextmanager
def git_workdir(ref, branch=None):
    try:
        with TemporaryDirectory() as tmpdir:
            branch_args = [] if branch is None else ["-b", branch]
            run_git(
                ["worktree", "add", *branch_args, tmpdir, ref],
                cwd=SCRIPT_DIR,
            )
            yield Path(tmpdir)
    finally:
        run_git(["worktree", "prune"], cwd=SCRIPT_DIR)


def generate_changelog(previous_tag, git_dir):
    print(f"Generating changelog for changes since {previous_tag}")
    log_lines = run_git(
        ["log", "--no-merges", "--format=%s", f"{previous_tag}.."],
        cwd=git_dir,
    ).splitlines()
    joined = "\n".join(f"  * {line}" for line in log_lines)
    return re.sub(r"[^\s]+/(.*?)(?:-sources?)?.(?:bst|yml)", r"\1", joined)


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
    with git_workdir(stable_branch, branch=news_branch) as git_dir:
        previous_tag = run_git(
            ["describe", "--abbrev=0", stable_branch],
            cwd=git_dir,
        )
        changelog = generate_changelog(previous_tag, git_dir)
        with fileinput.FileInput(git_dir / "NEWS", inplace=True, encoding="utf-8") as f:
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


def read_changelog(git_dir, new_version):
    """Read the NEWS entries for the new version.

    We could just generate the changelog again, as in generate_changelog(), however this
    allows us to validate that an entry has indeed been made matching the specified
    version.
    """
    lines = []
    reading = False
    with open(git_dir / "NEWS", encoding="utf-8") as f:
        for line in f:
            if reading:
                if line.strip() == "":
                    break
                lines.append(line[2:])
            if line.startswith(new_version):
                reading = True
        else:
            print(
                f"error: Failed to find NEWS entry for {new_version}", file=sys.stderr
            )
            sys.exit(1)
    return "".join(lines).strip()


def publish(args):
    gl = gitlab.Gitlab("https://gitlab.com", args.api_token)
    gl.auth()
    with git_workdir(args.commit) as git_dir:
        changelog = read_changelog(git_dir, args.new_version)
        run_git(
            ["tag", "-asm", args.new_version, args.new_version],
            cwd=git_dir,
        )
        run_git(["push", args.remote, args.new_version], cwd=git_dir)
    project = gl.projects.get(FD_SDK_ID, lazy=True)
    project.releases.create(
        {
            "name": args.new_version,
            "tag_name": args.new_version,
            "description": changelog,
        }
    )


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument(
        "-r",
        "--remote",
        default="origin",
        help="The configured remote to perform git operations against",
    )
    subparsers = parser.add_subparsers()

    prepare_parser = subparsers.add_parser("prepare", help="Prepare a release")
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

    publish_parser = subparsers.add_parser("publish", help="Publish a release")
    publish_parser.add_argument(
        "api_token", help="The API token used to create a GitLab release entry"
    )
    publish_parser.add_argument("new_version", help="The new release tag/version")
    publish_parser.add_argument("commit", help="The commit to tag")
    publish_parser.set_defaults(func=publish)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
