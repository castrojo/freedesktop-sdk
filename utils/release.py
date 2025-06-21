#!/usr/bin/env python3
"""Helper script for preparing and publishing release."""

import argparse
import datetime
import re
import shlex
import subprocess
import textwrap
from contextlib import contextmanager
from pathlib import Path
from tempfile import TemporaryDirectory

import ruamel.yaml
from packaging.version import Version
from ruamel.yaml.scalarstring import LiteralScalarString

SCRIPT_DIR = Path(__file__).resolve().parent
FD_SDK_ID = 4339844


def LS(s):
    return LiteralScalarString(textwrap.dedent(s))


def release_version(value):
    if not re.match(r"^freedesktop-sdk-\d{2}\.08(?:beta|rc)?\.\d+(?:\.\d+)?$", value):
        raise argparse.ArgumentTypeError(
            f"'{value}' does not match the expected freedesktop-sdk tag format"
        )

    return value


def validate_version_increment(first_ver, second_ver):
    try:
        v1_parts = list(map(int, first_ver.split(".")))
        v2_parts = list(map(int, second_ver.split(".")))

        if not all(len(v) == 3 for v in (v1_parts, v2_parts)):
            return False

        if v1_parts[:2] != v2_parts[:2]:
            return False

        return abs(v1_parts[2] - v2_parts[2]) == 1
    except ValueError:
        return False


def run_git(cmd, **kwargs):
    return subprocess.check_output(["git", *cmd], text=True, **kwargs).rstrip()


@contextmanager
def git_workdir(ref, branch=None):
    try:
        with TemporaryDirectory() as tmpdir:
            branch_args = [] if branch is None else ["-b", branch]
            run_git(["worktree", "add", *branch_args, tmpdir, ref], cwd=SCRIPT_DIR)
            yield Path(tmpdir)
    finally:
        run_git(["worktree", "prune"], cwd=SCRIPT_DIR)


def generate_changelog(previous_tag, git_dir):
    print(f"Generating changelog for changes since {previous_tag}")
    log_lines = run_git(
        ["log", "--no-merges", "--format=%s", f"{previous_tag}.."], cwd=git_dir
    ).splitlines()
    joined = "\n".join(f" * {line}" for line in log_lines)
    return re.sub(r"[^\s]+/(.*?)(?:-sources?)?.(?:bst|yml)", r"\1", joined)


def maybe_push(push, git_dir, message, remote, stable_branch, news_branch):
    push_args = [
        "push",
        "--push-option=merge_request.create",
        f"--push-option=merge_request.target={stable_branch}",
        f"--push-option=merge_request.title=Draft: {message}",
        remote,
        news_branch,
    ]

    if push:
        run_git(push_args, cwd=git_dir)
    else:
        print("To submit an MR for the release branch run:")
        print("    " + shlex.join(["git", *push_args]))


def prepare(args):
    news_branch = f"news/{args.new_version}"
    stable_branch = f"{args.remote}/{args.stable_branch}"

    if args.stable_branch.startswith("release/"):
        branch_version = args.stable_branch.removeprefix("release/")
        input_version = args.new_version.removeprefix("freedesktop-sdk-")
        if any(i in input_version for i in ("rc", "beta")):
            raise SystemExit(
                f"error: Tag is for release branch but uses rc or beta: {args.new_version}"
            )
        if not input_version.startswith(branch_version):
            raise SystemExit(
                f"error: Incorrect tag version {args.new_version} for branch {args.stable_branch}"
            )

    run_git(["fetch", "--prune", args.remote])
    with git_workdir(stable_branch, branch=news_branch) as git_dir:
        previous_tag = run_git(["describe", "--abbrev=0", stable_branch], cwd=git_dir)
        changelog = generate_changelog(previous_tag, git_dir)

        yaml = ruamel.yaml.YAML()
        with open(git_dir / "NEWS.yml", encoding="utf-8") as news:
            documents = list(yaml.load_all(news.read()))
        for document in documents:
            if document["Version"] == args.new_version:
                raise SystemExit(
                    f"error: {args.new_version} already exists in NEWS.yml"
                )
        documents.insert(
            0,
            {
                "Version": args.new_version,
                "Date": datetime.date.today().isoformat(),
                "Description": LS(f"Changes in {args.new_version}\n" + changelog),
            },
        )
        version0 = documents[0]["Version"].removeprefix("freedesktop-sdk-")
        version1 = documents[1]["Version"].removeprefix("freedesktop-sdk-")
        if Version(version0) < Version(version1):
            raise SystemExit(f"error: {version0} not newer than {version1}")
        if all(
            not any(s in v for s in ("rc", "beta")) for v in (version0, version1)
        ) and not validate_version_increment(version0, version1):
            raise SystemExit(
                f"error: Version increment is not 1, prevous version: {version1} current version: {version0}"
            )
        with open(git_dir / "NEWS.yml", "w", encoding="utf-8") as news:
            yaml.dump_all(documents, news)
        message = f"NEWS: Update for {args.new_version}"
        run_git(["commit", "-m", message, "NEWS.yml"], cwd=git_dir)
        maybe_push(
            args.push, git_dir, message, args.remote, args.stable_branch, news_branch
        )


def read_changelog(git_dir, new_version):
    """Read the NEWS entries for the new version.

    We could just generate the changelog again, as in generate_changelog(), however this
    allows us to validate that an entry has indeed been made matching the specified
    version.
    """
    with open(git_dir / "NEWS.yml", encoding="utf-8", newline="\n") as f:
        yaml = ruamel.yaml.YAML()
        documents = yaml.load_all(f)
        for document in documents:
            if document["Version"] == new_version:
                return document["Description"]
        raise RuntimeError(f"Version {new_version} does not exist in NEWS.yml")


def publish(args):
    with git_workdir(args.commit) as git_dir:
        changelog = read_changelog(git_dir, args.new_version)
        run_git(["tag", "-asm", args.new_version, args.new_version], cwd=git_dir)
        run_git(["push", args.remote, args.new_version], cwd=git_dir)


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
    prepare_parser.add_argument(
        "new_version", type=release_version, help="The new release tag/version"
    )
    prepare_parser.set_defaults(func=prepare)

    publish_parser = subparsers.add_parser("publish", help="Publish a release")
    publish_parser.add_argument(
        "new_version", type=release_version, help="The new release tag/version"
    )
    publish_parser.add_argument("commit", help="The commit to tag")
    publish_parser.set_defaults(func=publish)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
