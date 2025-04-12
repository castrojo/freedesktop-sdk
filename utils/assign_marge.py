#!/usr/bin/env python3
"""Usage: python utils/assign_marge.py"""

import argparse
import os

import gitlab
from gitlab.exceptions import GitlabListError

GITLAB_URL = "https://gitlab.com"
PRIVATE_TOKEN = os.environ.get("FREEDESKTOP_API_KEY")
PROJECT_ID = os.environ.get("CI_PROJECT_ID", "4339844")
ASSIGNEE_ID = os.environ.get("ASSIGNEE_ID", "2700514")
MASTER_VERSION = float(os.environ.get("RUNTIME_VERSION"))


def should_skip_mr(mr):
    # this is a blocklist as `mergeable` means the branch has to be
    # rebased, which marge can handle
    # https://docs.gitlab.com/ee/api/merge_requests.html#merge-status
    status_blocked = (
        "approvals_syncing",
        "checking",
        "commits_status",
        "preparing",
        "requested_changes",
        "not_approved",
        "discussions_not_resolved",
        "ci_still_running",
        "ci_must_pass",
        "conflict",
        "unchecked",
    )

    if mr.assignee is not None and mr.assignee["id"] == int(ASSIGNEE_ID):
        print(f"Skipping MR {mr.iid}, already assigned to Marge")
        return True

    # Marge cannot handle forks
    if mr.source_project_id != mr.target_project_id:
        print(f"Skipping MR {mr.iid} as it is from a fork")
        return True

    if mr.detailed_merge_status in status_blocked:
        print(f"Skipping MR {mr.iid}, not mergeable: {mr.detailed_merge_status}")
        return True

    return False


def main(dry_run):
    default_br = os.environ["CI_DEFAULT_BRANCH"]
    is_default_branch = os.getenv("CI_COMMIT_BRANCH", "") == default_br
    branches = [
        f"{default_br}",
        f"release/{MASTER_VERSION - (1 if is_default_branch else 0)}",
        f"release/{MASTER_VERSION - (2 if is_default_branch else 1)}",
    ]

    gl = gitlab.Gitlab(GITLAB_URL, private_token=PRIVATE_TOKEN)
    project = gl.projects.get(PROJECT_ID, lazy=True)

    news_mr = []

    for branch in branches:
        print(f"Processing branch {branch}")

        try:
            news_mr = project.mergerequests.list(
                state="opened", target_branch=branch, search="NEWS:", **{"in": "title"}
            )
        except GitlabListError as err:
            print(f"Error while fetching NEWS MR: {err}")

        if news_mr:
            print(f"Skipping branch {branch}, NEWS MR found")
            continue

        mergeable_mrs = []
        open_mrs = []

        try:
            # operate only on MRs opened by the updater bot
            # with no labels (as we use labels in case abi changes or blocked)
            # and not draft, to keep it safe
            open_mrs = project.mergerequests.list(
                state="opened",
                target_branch=branch,
                labels=(),
                wip="no",
                approved="yes",
                get_all=True,
            )
        except GitlabListError as err:
            print(f"Error while fetching open MRs: {err}")

        if not open_mrs:
            print(f"No open MRs found for branch {branch}")
            continue
        else:
            print(f"Found open MRs for branch {branch}")

        # Skip if too many open MRs are found
        # as checking and assigning becomes slower
        if len(open_mrs) >= 30:
            print(f"Skipping branch {branch}, too many open MRs to process")
            continue

        for mr in open_mrs:
            if not should_skip_mr(mr):
                mergeable_mrs.append(mr)

        if not mergeable_mrs:
            print(f"No mergeable MRs found for branch {branch}")
            continue
        else:
            print(f"Found mergeable MRs for branch {branch}")

        if len(mergeable_mrs) >= 2:
            for mr in mergeable_mrs:
                if dry_run:
                    print(f"Dry run: Assigned MR {mr.iid} to Marge")
                else:
                    mr.assignee_ids = ASSIGNEE_ID
                    mr.save()
                    print(f"Assigned MR {mr.iid} to Marge")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Assign MRs to Marge")
    parser.add_argument("--dry-run", action="store_true", help="Perform a dry run")
    args = parser.parse_args()

    main(dry_run=args.dry_run)
