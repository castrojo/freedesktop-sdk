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


def get_target_branch():
    return os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]


def get_makefile_var(makefile, var):
    with open(makefile, "r", encoding="utf-8") as file:
        for line in file:
            match = re.match(rf"^\s*{var}\s*=\s*(.+)$", line)
            if match:
                return match.group(1).strip()
    return ""


def validate(args):
    yaml = ruamel.yaml.YAML()
    with open(args.path, encoding="utf-8") as yaml_in:
        obj = yaml.load(yaml_in)
        flatpak_br = obj["freedesktop-sdk-flatpak-branch"]
        flatpak_extra_br = obj["freedesktop-sdk-flatpak-branch-extra"]

    makefile_br = get_makefile_var("Makefile", "BRANCH")

    if get_target_branch() == os.environ["CI_DEFAULT_BRANCH"]:
        assert re.match(MAIN_BETA_REGEX, makefile_br) is not None, makefile_br
        assert re.match(MAIN_BETA_REGEX, flatpak_br) is not None, flatpak_br
        assert re.match(MAIN_BETA_EXTRA_REGEX, flatpak_extra_br) is not None, (
            flatpak_extra_br
        )
    else:
        assert re.match(MAIN_STABLE_REGEX, makefile_br) is not None, makefile_br
        assert re.match(MAIN_STABLE_REGEX, flatpak_br) is not None, flatpak_br
        assert re.match(MAIN_STABLE_EXTRA_REGEX, flatpak_extra_br) is not None, (
            flatpak_extra_br
        )

    if re.match(MAIN_BETA_REGEX, makefile_br) is not None:
        assert re.match(MAIN_BETA_REGEX, flatpak_br) is not None, flatpak_br
        assert re.match(MAIN_BETA_EXTRA_REGEX, flatpak_extra_br) is not None, (
            flatpak_extra_br
        )

    if re.match(MAIN_STABLE_REGEX, makefile_br) is not None:
        assert re.match(MAIN_STABLE_REGEX, flatpak_br) is not None, flatpak_br
        assert re.match(MAIN_STABLE_EXTRA_REGEX, flatpak_extra_br) is not None, (
            flatpak_extra_br
        )


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
