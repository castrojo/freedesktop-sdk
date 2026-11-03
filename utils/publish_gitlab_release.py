#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import argparse
import os
import pprint
import subprocess
import sys
from functools import cache

import gitlab


def get_tag_message(tag):
    result = subprocess.run(
        ["git", "tag", "-l", f"{tag}", "--format='%(contents)'"],
        capture_output=True,
        check=True,
    )
    tag_message = result.stdout.decode().removeprefix("'")
    tag_message = tag_message.split("-----")[0]  # Drop the PGP signature at the end
    return tag_message


@cache
def get_tag_sha(tag):
    result = subprocess.run(
        ["git", "rev-list", "-n", "1", f"{tag}"], capture_output=True, check=True
    )

    return result.stdout.decode().strip()


@cache
def get_release_branch(tag):
    # e.g. freedesktop-sdk-25.08.18 -> ["25", "08", "18"]
    version = tag.removeprefix("freedesktop-sdk-").split(".")
    # e.g. ["25", "08", "18"] -> "25.08"
    generation = f"{version[0]}.{version[1]}"
    return generation


def get_release_assets(tag, project_id):
    # e.g. release/25.08 -> release-25.08
    release_slug = f"release-{get_release_branch(tag)}"
    sha = get_tag_sha(tag)

    package_url = f"https://gitlab.com/api/v4/projects/{project_id}/packages/generic"

    cve_reports_url = f"{package_url}/cve-reports-{release_slug}/{sha}"
    sbom_reports_url = f"{package_url}/sbom-reports-{release_slug}/{sha}"

    return [
        {
            "name": "Platform CVE report",
            "url": f"{cve_reports_url}/platform.md.html",
            "link_type": "other",
        },
        {
            "name": "SDK CVE report",
            "url": f"{cve_reports_url}/sdk.md.html",
            "link_type": "other",
        },
        {
            "name": "Components CVE report",
            "url": f"{cve_reports_url}/components.md.html",
            "link_type": "other",
        },
        {
            "name": "x86_64 SBOM reports",
            "url": f"{sbom_reports_url}/sbom-reports_x86_64_standard.tar.xz",
            "link_type": "other",
        },
        {
            "name": "AARCH64 SBOM reports",
            "url": f"{sbom_reports_url}/sbom-reports_aarch64_standard.tar.xz",
            "link_type": "other",
        },
    ]


def get_release_description(tag):
    return f"""
## Freedesktop Flatpak Runtimes & SDKs

To use Freedesktop SDK as a Flatpak runtime and SDK checkout the [Flatpak Documentation](https://docs.flatpak.org/)

- Install the runtime with `flatpak install org.freedesktop.platform//{get_release_branch(tag)}`
- Update the runtime with `flatpak update org.freedesktop.platform//{get_release_branch(tag)}`

A full list of Flatpak targets are available in the [Flatpak Targets Documentation](https://freedesktop-sdk.gitlab.io/documentation/guides/flatpak/flatpak-targets.html)

## Using the SDK in your project

In a junction element, specify Freedesktop SDK in the sources, as in the following example:

```
kind: junction
sources:
- kind:  git_repo
  url:   gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: freedesktop-sdk-{get_release_branch(tag)}*
  ref: {tag}-0-g{get_tag_sha(tag)}
```

For further information see: https://freedesktop-sdk.gitlab.io/documentation/guides/os/using-the-sdk/index.html

## OS Images

Pre-built OS images are not currently available for this release.
A list of example OS Image targets are available in the [OS Image Targets Documentation](https://freedesktop-sdk.gitlab.io/documentation/guides/os/os-targets.html)
See [OS Building Documentation](https://freedesktop-sdk.gitlab.io/documentation/guides/os/building-os.html) on how to build them.

## OCI Images

Pull image with `docker pull freedesktopsdk/platform:{get_release_branch(tag)}`

Pre-built Docker images are available in the [Freedesktop SDK Docker Hub image repository](https://hub.docker.com/u/freedesktopsdk).
A full list of OCI Image targets are available in the [OCI Image Targets Documentation](https://freedesktop-sdk.gitlab.io/documentation/guides/oci/OCI-targets.md)

## {get_tag_message(tag).strip()}
"""


def main(args):
    try:
        gitlab_client = gitlab.Gitlab(args.gitlab_url, private_token=args.private_token)
    except gitlab.GitlabError as e:
        print(f"Could not connect to the GitLab instance: {e}")
        sys.exit(1)
    try:
        project = gitlab_client.projects.get(args.project_id, lazy=True)
    except gitlab.GitlabError:
        print(f"Could not get project: {args.project_id}")
        sys.exit(1)

    release_data = {
        "name": args.release_tag,
        "tag_name": args.release_tag,
        "description": get_release_description(args.release_tag),
        "assets": get_release_assets(args.release_tag, args.project_id),
    }

    if not args.actually_create_release:
        print(f"Dry run of creating a release for {args.release_tag}")
        print("The release would have been created with the following information:")
        print("==========name==============")
        print(release_data["name"])
        print("==========description==============")
        print(release_data["description"])
        print("============assets=================")
        pprint.pp(release_data["assets"])
        sys.exit(0)

    project.releases.create(release_data)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate a Gitlab Release (by default it does a dry run)"
    )
    parser.add_argument(
        "--actually-create-release",
        action="store_true",
        help="Actually create the release instead of doing a dry run",
    )
    parser.add_argument(
        "--gitlab-url", default=os.environ.get("$CI_SERVER_HOST", "https://gitlab.com")
    )
    parser.add_argument(
        "--project-id", default=os.environ.get("CI_PROJECT_ID", "4339844")
    )
    parser.add_argument("--private-token", default=os.environ.get("CI_JOB_TOKEN"))
    parser.add_argument("--release-tag", default=os.environ.get("CI_COMMIT_TAG"))
    args = parser.parse_args()

    assert args.release_tag, "Must provide a tag for the release"
    if args.actually_create_release:
        assert args.private_token, (
            "Must have private token to actually create the release"
        )

    main(args)
