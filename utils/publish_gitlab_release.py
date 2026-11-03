#!/usr/bin/env python3

import subprocess
import sys
import os
import argparse

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


def get_tag_sha(tag):
    result = subprocess.run(
        ["git", "rev-list", "-n", "1", f"{tag}"],
        capture_output=True,
        check=True,
    )

    return result.stdout.decode().strip()


def get_release_branch(tag):
    # e.g. freedesktop-sdk-25.08.18 -> ["25", "08", "18"]
    version = tag.removeprefix("freedesktop-sdk-").split(".")
    # e.g. ["25", "08", "18"] -> "25.08"
    generation = f"{version[0]}.{version[1]}"
    return f"release/{generation}"


def get_release_assets(tag, project_id):
    # e.g. release/25.08 -> release-25.08
    release_slug = get_release_branch(tag).replace("/", "-")
    sha = get_tag_sha(tag)
    print(sha, release_slug)

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


def main(args):
    try:
        gitlab_client = gitlab.Gitlab(args.gitlab_url, private_token=args.private_token)
    except Exception as e:
        print(f"Could not connect to the GitLab instance: {e}")
        sys.exit(1)
    try:
        project = gitlab_client.projects.get(args.project_id, lazy=True)
    except Exception:
        print(f"Could not get project: {args.project_id}")
        sys.exit(1)

    release_data = {
        "name": args.release_tag,
        "tag_name": args.release_tag,
        "description": get_tag_message(args.release_tag),
        "assets": get_release_assets(args.release_tag, args.project_id),
    }

    if not args.actually_create_release:
        print(f"Dry run of creating a release for {args.release_tag}")
        print("The release would have been created with the following information:")
        print(release_data)
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
        assert (
            args.private_token
        ), "Must have private token to actually create the release"

    main(args)
