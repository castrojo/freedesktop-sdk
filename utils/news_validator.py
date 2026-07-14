#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

"""Usage: python utils/news_validator.py validate --path NEWS.yml"""

import argparse
import datetime
import json
import re

import ruamel.yaml

FD_SDK_TAG_FORMAT = r"^freedesktop-sdk-\d{2}\.08(?:beta|rc)?\.\d+(?:\.\d+)?$"


def validate(args):
    yaml = ruamel.yaml.YAML()
    tag_list = []
    with open(args.path, encoding="utf-8") as yaml_in:
        news_obj = yaml.load_all(yaml_in)
        for item in news_obj:
            news_dict = json.loads(json.dumps(item))
            assert all(k in news_dict for k in ("Version", "Date", "Description"))
            assert list(news_dict)[:3] == ["Version", "Date", "Description"]
            tag = news_dict["Version"]
            tag_list.append(tag)
            tag_date = news_dict["Date"]
            desc = [i.strip() for i in news_dict["Description"].split("\n")]
            assert re.match(FD_SDK_TAG_FORMAT, tag)
            datetime.datetime.strptime(tag_date, "%Y-%m-%d").replace(
                tzinfo=datetime.UTC
            )
            assert len(desc) >= 1
            assert desc[0].startswith(f"Changes in {tag}")
    assert len(tag_list) == len(set(tag_list))


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    subparsers = parser.add_subparsers()

    validate_parser = subparsers.add_parser(
        "validate", help="Validate NEWS.yml for common mistakes"
    )
    validate_parser.add_argument(
        "--path", type=str, required=True, help="Path to NEWS.yml"
    )
    validate_parser.set_defaults(func=validate)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
