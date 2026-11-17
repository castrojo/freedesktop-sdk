#!/usr/bin/env python3
# /// script
# dependencies = [
#   "GitPython",
#   "python-gitlab",
# ]
# ///
# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: LGPL-3.0-or-later
"""Backport a merge request to the current-stable and old-stable branches.

Usage:
    backport-mr.py [--dry-run] [--force] <gitlab-mr-url>

The MR URL must look like:
    https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/merge_requests/<iid>

This must be run from inside a working copy of the repository the MR
belongs to; the script verifies that the current directory's origin
matches the MR's project and fails out otherwise. No clone is made:
the target branch is fetched into the existing working copy and the
landed commits are found there, matched against the MR's commit list
from the API, since the MR's source branch may have been deleted after
merging.

For each target branch in BACKPORT_BRANCHES the script:
  1. Fetches the target branch and creates a local branch
  2. Cherry-picks the MR's commits with `git cherry-pick -x`
  3. Pushes the branch and opens a merge request via the GitLab API.

With --dry-run the cherry-picks are still performed locally (so conflicts
are detected), but nothing is pushed and no MR is created.

Authentication uses the GITLAB_TOKEN environment variable, a token from
~/.config/python-gitlab/config, or a matching 'machine gitlab.com' entry in
~/.netrc for the API, and normal git credentials for pushing. Required
permissions for the token are API read/write so that MRs can be both read and
created by the script.

The branch the script is run from is restored on exit, whether the
backport succeeded or failed. If a cherry-pick conflicts, the script
aborts the cherry-pick and exits with an error.
"""

import argparse
import netrc as netrc_module
import os
import re
import sys
from pathlib import Path

import gitlab
from git import Repo
from git.exc import GitCommandError, InvalidGitRepositoryError
from gitlab.exceptions import GitlabError
from gitlab.v4.objects import MergeRequest, Project

BACKPORT_BRANCHES = {"current-stable": "release/26.08", "old-stable": "release/25.08"}


def parse_mr_url(url: str) -> tuple[str, int]:
    """Extract (project_path, mr_iid) from a GitLab MR URL."""
    m = re.match(r"^https?://gitlab\.com/(.+?)/-/merge_requests/(\d+)", url)
    if m is None:
        raise ValueError(f"Unrecognized GitLab MR URL: {url!r}")
    return m.group(1), int(m.group(2))


def open_local_repo(project_path: str) -> Repo:
    """Open the git repo in the current directory and validate it.

    Fails if there is no repo, no origin remote, the origin does not match
    the MR's GitLab project, or the working tree has uncommitted changes.
    """
    try:
        repo = Repo(Path.cwd(), search_parent_directories=True)
    except InvalidGitRepositoryError:
        raise RuntimeError(
            "not inside a git repository; run this script from a working "
            "copy of the MR's repository."
        ) from None

    try:
        origin_url = repo.remotes.origin.url
    except AttributeError:
        raise RuntimeError(
            "this repository has no 'origin' remote; cannot verify it is "
            "the MR's repository."
        ) from None

    if project_path not in origin_url:
        raise RuntimeError(
            f"origin '{origin_url}' does not match the MR's project "
            f"'{project_path}'; this must be run from a working copy of the "
            "repository the MR belongs to."
        )

    if repo.is_dirty():
        raise RuntimeError(
            "the working tree has uncommitted changes; commit or stash them "
            "before backporting."
        )

    return repo


def get_landed_commits(repo: Repo, source_mr: MergeRequest) -> list[str]:
    """Return the commits that landed on the MR's target branch, oldest first.

    The MR's source branch may have been deleted, so the commits are taken
    from the target branch rather than from the MR head. Marge rebases and
    fast-forwards, so a merged MR often has no merge commit at all: use the
    MR's commit list to identify the landed commits by message and count.
    """
    target_branch = source_mr.target_branch
    print(f"Fetching origin/{target_branch} ...")
    repo.git.fetch(
        "origin", f"+refs/heads/{target_branch}:refs/remotes/origin/{target_branch}"
    )

    merge_sha = getattr(source_mr, "merge_commit_sha", None) or getattr(
        source_mr, "squash_commit_sha", None
    )
    if not merge_sha:
        trailer = re.compile(rf"See merge request (?:\S+!)?{source_mr.iid}\b")
        for commit in repo.iter_commits(f"origin/{target_branch}"):
            if trailer.search(commit.message):
                merge_sha = commit.hexsha
                break

    if not merge_sha:
        raise RuntimeError(
            f"Could not find the merge commit for !{source_mr.iid} on "
            f"'{target_branch}'."
        )

    # The tip may not be reachable from the target branch tip (e.g. when the
    # MR was merged with a merge commit), so fetch it explicitly.
    print(f"Fetching merge commit {merge_sha[:10]} ...")
    repo.git.fetch("origin", merge_sha)

    merge_commit = repo.commit(merge_sha)
    if len(merge_commit.parents) >= 2:
        first_parent, second_parent = merge_commit.parents[:2]
        return [
            commit.hexsha
            for commit in repo.iter_commits(
                f"{first_parent.hexsha}..{second_parent.hexsha}", no_merges=True
            )
        ][::-1]

    # A rebase followed by a fast-forward leaves the MR's commits directly on
    # the target branch as a consecutive run ending at `merge_sha`. Rebasing
    # changes their SHAs, so match the API's commit list against the commits
    # leading up to the tip by message. The list may be oldest- or newest-first.
    mr_messages = [commit.message.strip() for commit in source_mr.commits()]
    if not mr_messages:
        return [merge_sha]

    for messages in (mr_messages, mr_messages[::-1]):
        matched = []
        for commit in repo.iter_commits(merge_sha, no_merges=True):
            if len(matched) == len(messages):
                break
            if commit.message.strip() == messages[len(matched)]:
                matched.append(commit.hexsha)
        if len(matched) == len(messages):
            return matched[::-1]

    raise RuntimeError(
        f"Could not match the commits of !{source_mr.iid} on '{target_branch}'."
    )


def backport_to(
    project: Project,
    repo: Repo,
    commits: list[str],
    source_mr: MergeRequest,
    target_branch: str,
    dry_run: bool,
    force: bool = False,
) -> None:
    """Backport `commits` to `target_branch` and open an MR for it.

    If an MR already exists for the backport branch and `force` is set, it is
    reused and updated rather than bailing out.
    """
    backport_branch = f"backport/{source_mr.iid}-{target_branch.replace('/', '-')}"
    origin = repo.remotes.origin

    mrs = project.mergerequests.list(
        state="opened", source_branch=backport_branch, target_branch=target_branch
    )
    existing_mr = mrs[0] if mrs else None

    if existing_mr and not force:
        print(f"\talready backported: {existing_mr.web_url}")
        return

    if existing_mr and force:
        print(f"\tforce: reusing existing MR {existing_mr.web_url}")

    print(f"\tfetching origin/{target_branch} ...")
    origin.fetch(f"+refs/heads/{target_branch}:refs/remotes/origin/{target_branch}")

    if backport_branch in repo.heads:
        print(f"\tusing existing branch '{backport_branch}' ...")
    else:
        print(f"\tcreating branch '{backport_branch}' ...")
    repo.git.checkout("-B", backport_branch, f"origin/{target_branch}")

    for commit in commits:
        print(f"\tcherry-picking {commit[:10]} ...")
        try:
            repo.git.cherry_pick("-x", commit)
        except GitCommandError as exc:
            raise RuntimeError(
                f"Cherry-pick of {commit[:10]} onto '{target_branch}' failed: {exc}."
            ) from exc

    if dry_run:
        print(f"\t[dry run] cherry-pick succeeded; not pushing '{backport_branch}'")
        return

    print(f"\tpushing '{backport_branch}' ...")
    origin.push(backport_branch, force=True, set_upstream=True).raise_if_error()

    title = f'Backport "{source_mr.title}" to {target_branch}'
    description = (
        f"Backport of {source_mr.web_url}+s to `{target_branch}`.\n\n"
        f"{source_mr.description}\n\n"
        "Automatically generated by the `backport-mr` script"
    )

    if existing_mr and force:
        print(f"\tupdating MR '{title}' ...")
        existing_mr.title = title
        existing_mr.description = description
        existing_mr.save()
        mr = existing_mr
    else:
        print(f"\topening MR '{title}' ...")
        mr = project.mergerequests.create(
            {
                "source_branch": backport_branch,
                "target_branch": target_branch,
                "title": title,
                "description": description,
            }
        )
    print(f"\tMR: {mr.web_url}")


def netrc_token(host: str) -> str | None:
    """Return the password for `host` from ~/.netrc, or None if not found."""
    try:
        auth = netrc_module.netrc().authenticators(host)
        return auth[2] if auth else None
    except (FileNotFoundError, netrc_module.NetrcParseError):
        return None


def backport_mr(args: argparse.Namespace) -> None:
    project_path, mr_iid = parse_mr_url(args.mr_url)

    repo = open_local_repo(project_path)
    try:
        start_branch = repo.active_branch.name
    except TypeError:
        start_branch = repo.head.commit.hexsha

    try:
        gl_kwargs = {}
        if (token := os.environ.get("GITLAB_TOKEN")) or (
            token := netrc_token("gitlab.com")
        ):
            gl_kwargs["private_token"] = token
        gl = gitlab.Gitlab("https://gitlab.com", **gl_kwargs)

        project = gl.projects.get(project_path)
        source_mr = project.mergerequests.get(mr_iid)
        print(f"Source MR !{source_mr.iid} '{source_mr.title}' -> {source_mr.web_url}")

        if source_mr.state != "merged":
            raise RuntimeError(
                f"MR !{source_mr.iid} is not merged (state: {source_mr.state}); "
                "only merged MRs can be backported."
            )

        commits = get_landed_commits(repo, source_mr)
        if not commits:
            raise RuntimeError(
                f"Could not find commits of MR !{mr_iid}; cannot backport."
            )
        print(f"\nBackporting {len(commits)} commit(s):")

        for commit in commits:
            print(f"\t{commit[:10]} {repo.commit(commit).summary}")

        backport_branches = (
            list(BACKPORT_BRANCHES.items())
            if args.backport_branch is None
            else [("custom", args.backport_branch)]
        )

        for label, branch in backport_branches:
            print(f"\nBackporting to {label} ({branch}):")
            backport_to(
                project, repo, commits, source_mr, branch, args.dry_run, args.force
            )
    finally:
        # A failed cherry-pick leaves the sequencer in progress, so clear it
        # before switching back to where the user started.
        if (Path(repo.git_dir) / "CHERRY_PICK_HEAD").exists():
            try:
                repo.git.cherry_pick("--abort")
            except GitCommandError:
                pass
        repo.git.checkout(start_branch)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Backport a merged MR to the stable branches."
    )
    parser.add_argument(
        "mr_url",
        help="URL of the MR, e.g. "
        "https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/merge_requests/123",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="cherry-pick locally to check for conflicts, but do not push "
        "or create any MR",
    )
    parser.add_argument(
        "--backport-branch",
        help="Target branch for backport, overrides the standard pattern of `current-stable` & `old-stable`",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="overwrite an existing backport MR: re-cherry-pick, force-push "
        "the branch, and update the existing MR instead of bailing out",
    )
    return parser.parse_args()


if __name__ == "__main__":
    try:
        backport_mr(parse_args())
    except (RuntimeError, ValueError, GitCommandError, GitlabError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        sys.exit(1)
