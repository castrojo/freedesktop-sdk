# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import datetime
import subprocess
import sys
import textwrap

import ruamel.yaml
from ruamel.yaml.scalarstring import LiteralScalarString


def LS(s):
    return LiteralScalarString(textwrap.dedent(s))


def query_date(identifier):
    process = subprocess.run(
        ["git", "log", "-1", '--format="%at"', identifier],
        capture_output=True,
        check=True,
        text=True,
    )
    timestamp = process.stdout.strip('" \n')
    date = datetime.datetime.fromtimestamp(int(timestamp), tz=datetime.UTC).date()
    return date.isoformat()


def generate_documents(news):
    block = {}
    description = []
    for line in news:
        line = line.rstrip()
        if not line:
            if block:
                if len(description) > 1:
                    block["Description"] = LS("\n".join(description))
                yield block
            description.clear()
            block = {}
        if line.startswith("freedesktop-sdk") and line.endswith(":"):
            line = line.strip(" :")
            block = {"Version": line, "Date": query_date(line)}
            description.append(f"Changes in {line}")
        elif block:
            description.append(line)
    if block:
        if len(description) > 1:
            block["Description"] = LS("\n".join(description))
        yield block


if __name__ == "__main__":
    with open(sys.argv[1], encoding="utf-8") as news:
        documents = list(generate_documents(news))
    print(len(documents))
    documents = documents[:]
    with open(sys.argv[2], "w", encoding="utf-8") as yaml_news:
        yaml = ruamel.yaml.YAML()
        yaml.dump_all(documents, yaml_news)
