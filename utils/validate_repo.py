#!/usr/bin/env python3
"""Usage python validate_repo.py --path /path/to/ostree/repo"""

import argparse
import os
import re
import subprocess
from urllib.parse import urlparse

FDSDK_REPO_HOSTNAME = "releases.freedesktop-sdk.io"
FLATHUB_REPO_HOSTNAME = "hub.flathub.org"
REF_ARCHES = ("x86_64", "aarch64")
BETA_FDSDK_TAG_PATTERN = r"^freedesktop-sdk-\d{2}\.08(beta|rc)\.\d+(?:\.\d+)?$"
STABLE_FDSDK_TAG_PATTERN = r"^freedesktop-sdk-\d{2}\.08\.\d+(?:\.\d+)?$"
# validate against the wrong pattern because this got tagged with
# the wrong branch name and it is too late to fix this
# https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/issues/1821
# DO NOT backport
STABLE_REF_BRANCH_PATTERN = r"^\d{2}\.08(?:extra)?$"
BETA_REF_BRANCH_PATTERN = r"^\d{2}\.08beta(?:extra)?$"


def get_hostname(url: str) -> str:
    return urlparse(url).hostname


def get_ostree_refs(path: str) -> set[str]:
    refs = subprocess.check_output(["ostree", "refs"], cwd=path).decode().splitlines()
    return set(refs)


def validate(path: str) -> None:
    if os.getenv("GITLAB_CI") != "true":
        raise ValueError("Not running inside GitLab CI")
    if os.getenv("CI_COMMIT_REF_PROTECTED") != "true":
        raise ValueError("Not running for a protected ref")

    tag = os.environ.get("CI_COMMIT_TAG")

    # From utils/publisher_env.sh
    release_server = os.environ["RELEASES_SERVER_ADDRESS"]
    release_channel = os.environ["RELEASE_CHANNEL"]

    refs = get_ostree_refs(path)
    if not refs:
        raise ValueError("No refs found in repo")

    ref_branches = set()
    for ref in refs:
        if ref.startswith(("appstream/", "appstream2/", "screenshots/")):
            continue

        ref_splits = ref.split("/")
        if len(ref_splits) != 4:
            raise ValueError(f"Invalid ref: {ref}")

        ref_branches.add(ref_splits[3])

        if ref_splits[2] not in REF_ARCHES:
            raise ValueError(f"Ref arch not in allowlist: {ref}")

        if ref_splits[1] not in (
            "org.freedesktop.Platform",
            "org.freedesktop.Sdk",
        ) and not ref_splits[1].startswith(
            ("org.freedesktop.Platform.", "org.freedesktop.Sdk.")
        ):
            raise ValueError(f"Ref ID not in allowlist: {ref}")

    release_server_hostname = get_hostname(release_server)

    if (
        release_server_hostname == FDSDK_REPO_HOSTNAME
        and not release_channel == "stable"
    ):
        raise ValueError("RELEASE_CHANNEL not set to stable for fdsdk internal repo")

    if tag and release_server_hostname == FLATHUB_REPO_HOSTNAME:
        if re.match(BETA_FDSDK_TAG_PATTERN, tag):
            if release_channel != "beta":
                raise ValueError(
                    "RELEASE_CHANNEL not set to beta for Flathub but tag is beta or rc"
                )
            if not all(re.match(BETA_REF_BRANCH_PATTERN, br) for br in ref_branches):
                raise ValueError(
                    "Ref branches do not match expected beta branch pattern"
                )
        if re.match(STABLE_FDSDK_TAG_PATTERN, tag):
            if release_channel != "stable":
                raise ValueError(
                    "RELEASE_CHANNEL not set to stable for Flathub but tag is stable"
                )
            if not all(re.match(STABLE_REF_BRANCH_PATTERN, br) for br in ref_branches):
                raise ValueError(
                    "Ref branches do not match expected stable branch pattern"
                )


def main():
    parser = argparse.ArgumentParser(description="Validate refs before publishing")
    parser.add_argument("--path", type=str, help="Path to OSTree repository")
    args = parser.parse_args()

    validate(args.path)


if __name__ == "__main__":
    main()
