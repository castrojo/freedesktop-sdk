#!/usr/bin/python3 -u

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: LGPL-3.0-or-later

"""Script to clean the package registry of expired packages."""

import argparse
import logging
import os
from datetime import UTC, datetime, timedelta

import requests

logger = logging.getLogger(__name__)


def get_all_packages(project_id: str, token: str, glab_api: str) -> list[dict]:
    """Collect all packages from a given project."""
    assert project_id is not None, (
        "Please set a project_id or the $CI_PROJECT_ID envvar"
    )
    url = f"{glab_api}/projects/{project_id}/packages"
    headers = {
        "PRIVATE-TOKEN": token  # Can be unset for dry runs on public repos
    }
    packages: list[dict] = []
    page = 1
    while page:
        r = requests.get(
            url, headers=headers, params={"per_page": 100, "page": page}, timeout=60
        )
        r.raise_for_status()
        page_packages = r.json()
        assert isinstance(page_packages, list), (
            f"Gitlab did not return a list of packages instead {type(page_packages)}"
        )
        packages.extend(page_packages)
        next_page = r.headers.get("X-Next-Page")
        page = int(next_page) if next_page else 0
    return packages


def filter_packages(packages: list[dict], max_age: int) -> list[dict]:
    """Filter packages which are expired.

    Tests:
        - Creation age
        - If package is named `testing`
    Skips:
        - Packages not versioned with only a commit hash
    """
    cutoff = datetime.now(tz=UTC) - timedelta(days=max_age)

    expired_packages: list[dict] = []
    for p in packages:
        if (
            "test" in p.get("name", "").lower()
            or "test" in p.get("version", "").lower()
        ):
            expired_packages.append(p)
            continue
        # Only process if the version is the commit sha (not a tag)
        if len(p.get("version", "")) != 40:
            logger.info("Keeping %s (not on SHA version)", format_package(p))
            continue

        created = (
            datetime.fromisoformat(p["created_at"])
            if "created_at" in p
            else datetime.now(UTC)
        )

        if created < cutoff:
            expired_packages.append(p)
            continue

    logger.info(
        "Found %d packages to remove out of %d", len(expired_packages), len(packages)
    )
    return expired_packages


def format_package(p: dict) -> str:
    """Human readable format for a gitlab package."""
    return f"{p.get('name', '')}@{p.get('version', '')} (id:{p.get('id', '')})"


def remove_package(project_id: str, package_id: str, token: str, glab_api: str):
    """Use gitlab API to delete a package."""
    assert token is not None, "$CI_JOB_TOKEN is required for deleting packages"
    r = requests.delete(
        f"{glab_api}/projects/{project_id}/packages/{package_id}",
        headers={"PRIVATE-TOKEN": token},
        timeout=60,
    )
    r.raise_for_status()


def clean_package_registry(args: argparse.Namespace):
    """Remove all expired packages from the package registry."""
    packages: list[dict] = get_all_packages(
        args.project_id, args.access_token, args.gitlab_api
    )
    expired: list[dict] = filter_packages(packages, args.max_age)
    for x in expired:
        logger.info("Removing %s", format_package(x))
        if args.dry_run:
            logger.info("Dry Run: Skipping...")
            continue
        if package_id := x.get("id"):
            remove_package(
                args.project_id, package_id, args.access_token, args.gitlab_api
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--project-id", default=os.environ.get("CI_PROJECT_ID"))
    parser.add_argument("--access-token", default=os.environ.get("CI_JOB_TOKEN"))
    parser.add_argument(
        "--gitlab-api",
        default=os.environ.get("CI_API_V4_URL", "https://gitlab.com/api/v4/"),
    )
    parser.add_argument(
        "--max-age", default=30, type=int, help="Max allowed age of a package (in days)"
    )
    parser.add_argument("--dry-run", action="store_true", default=False)
    parser.add_argument(
        "--loglevel",
        default="INFO",
        choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
    )
    args = parser.parse_args()
    logging.basicConfig(level=getattr(logging, args.loglevel))
    clean_package_registry(args)
