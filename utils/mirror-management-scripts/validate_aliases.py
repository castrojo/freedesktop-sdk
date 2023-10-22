#!/usr/bin/env python3

import argparse

from ruamel.yaml import YAML

parser = argparse.ArgumentParser()

EXCEPTIONS = {'freedesktop-sdk-project', 'pcre', 'freedesktop-sdk', 'fdsdk_registry'}


def yaml_argument(filename):
    yaml = YAML(typ='safe')
    with open(filename, encoding="utf-8") as file:
        return yaml.load(file)


parser.add_argument("aliases", type=yaml_argument)
parser.add_argument("mirrors", type=yaml_argument)


def mirror_keys(mirrors):
    for item in mirrors["mirrors"]:
        for alias in item["aliases"]:
            yield alias


def validate(aliases, mirrors):
    required = set(aliases)
    configured = set(mirror_keys(mirrors))
    missing = required - configured - EXCEPTIONS
    assert not missing, f"{missing} need mirror configured"


if __name__ ==  "__main__":
    parsed = parser.parse_args()
    validate(parsed.aliases, parsed.mirrors)
