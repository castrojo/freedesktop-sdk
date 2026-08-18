#!/usr/bin/python3 -u

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

"""Script to clean the package registry of expired packages."""

import argparse
import logging
import os
from datetime import UTC, datetime, timedelta

import requests

logger = logging.getLogger(__name__)
ACCESS_TOKEN = os.environ.get("CI_JOB_TOKEN")
PROJECT_ID = os.environ.get("CI_PROJECT_ID")
GITLAB_API = os.environ.get("CI_API_V4_URL", "https://gitlab.com/api/v4/")


def get_all_packages(project_id: str) -> list[dict]:
    """Collect all packages from a given project."""
    assert project_id is not None, (
        "Please set a project_id or the $CI_PROJECT_ID envvar"
    )
    r = requests.get(
        f"{GITLAB_API}/projects/{project_id}/packages",
        headers={
            "PRIVATE-TOKEN": ACCESS_TOKEN  # Can be unset for dry runs on public repos
        },
        timeout=60,
    )
    r.raise_for_status()
    packages: list[dict] = r.json()
    assert isinstance(packages, list), (
        f"Gitlab did not return a list of packages instead {type(packages)}"
    )
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

        if "testing" in p.get("name", ""):
            expired_packages.append(p)
            continue
    logger.info(
        "Found %d packages to remove out of %d", len(expired_packages), len(packages)
    )
    return expired_packages


def format_package(p: dict) -> str:
    """Human readable format for a gitlab package."""
    return f"{p.get('name', '')}@{p.get('version', '')} (id:{p.get('id', '')})"


def remove_package(project_id: str, package_id: str):
    """Use gitlab API to delete a package."""
    assert ACCESS_TOKEN is not None, "$CI_JOB_TOKEN is required for deleting packages"
    r = requests.delete(
        f"{GITLAB_API}/projects/{project_id}/packages/{package_id}",
        headers={"PRIVATE-TOKEN": ACCESS_TOKEN},
        timeout=60,
    )
    r.raise_for_status()


def clean_package_registry(args: argparse.Namespace):
    """Remove all expired packages from the package registry."""
    packages: list[dict] = get_all_packages(args.project_id)
    expired: list[dict] = filter_packages(packages, args.max_age)
    for x in expired:
        logger.info("Removing %s", format_package(x))
        if args.dry_run:
            logger.info("Dry Run: Skipping...")
            continue
        if package_id := x.get("id"):
            remove_package(args.project_id, package_id)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--project-id", default=PROJECT_ID)
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
