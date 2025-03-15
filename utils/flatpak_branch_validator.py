#!/usr/bin/env python3
"""Usage: python utils/flatpak_branch_validator.py validate --path include/repo_branches.yml"""

import argparse
import os
import re

import ruamel.yaml

MAIN_BETA_REGEX = r"^\d{2}\.08beta$"
MAIN_BETA_EXTRA_REGEX = r"^\d{2}\.08beta-extra$"
MAIN_STABLE_REGEX = r"^\d{2}\.08$"
MAIN_STABLE_EXTRA_REGEX = r"^\d{2}\.08-extra$"
SNAP_REGEX = r"^\d{2}08"

# validate against the wrong pattern because this got tagged with
# the wrong branch name and it is too late to fix this
# https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/issues/1821
# DO NOT backport
MAIN_STABLE_EXTRA_WRONG_REGEX = r"^\d{2}\.08extra$"


def get_target_branch():
    return os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]


def validate(args):
    yaml = ruamel.yaml.YAML()
    with open(args.path, encoding="utf-8") as yaml_in:
        obj = yaml.load(yaml_in)
        flatpak_br = obj["freedesktop-sdk-flatpak-branch"]
        flatpak_extra_br = obj["freedesktop-sdk-flatpak-branch-extra"]
        snap_br = obj["freedesktop-sdk-snap-branch"]

    if get_target_branch() == "master":
        assert re.match(MAIN_BETA_REGEX, flatpak_br) is not None, flatpak_br
        assert (
            re.match(MAIN_BETA_EXTRA_REGEX, flatpak_extra_br) is not None
        ), flatpak_extra_br
    else:
        assert (
            re.match(MAIN_STABLE_EXTRA_WRONG_REGEX, flatpak_br) is not None
        ), flatpak_br
        assert (
            re.match(MAIN_STABLE_EXTRA_WRONG_REGEX, flatpak_extra_br) is not None
        ), flatpak_extra_br

    assert re.match(SNAP_REGEX, snap_br) is not None, snap_br


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    subparsers = parser.add_subparsers()

    validate_parser = subparsers.add_parser(
        "validate", help="Validate Flatpak branch definitions"
    )
    validate_parser.add_argument(
        "--path", type=str, required=True, help="Path to branch definitions in YML"
    )
    validate_parser.set_defaults(func=validate)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
