# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import urllib.request
from itertools import batched, groupby

MAX_LINE = 10


def get_fedora_file(url: str) -> str:
    req = urllib.request.Request(url)
    plugins = []
    excludes = ["libopenh264"]
    with urllib.request.urlopen(req) as response:
        for line in response.readlines():
            line = line.decode()
            plugin = line.split("#")[0].strip()

            if plugin and plugin not in excludes:
                plugins.append(plugin)

    return format_list(plugins)


def format_list(plugins: list[str]) -> str:
    output = ""
    alpha = {
        key: list(group) for key, group in groupby(sorted(plugins), key=lambda s: s[0])
    }
    for values in alpha.values():
        for v in list(batched(values, MAX_LINE)):
            output += ",".join(v) + ",\\\n    "
    # Strip off last \ for formatting
    return output.strip().rsplit(",\\", 1)[0]


def main():
    encoders = "https://src.fedoraproject.org/rpms/ffmpeg/raw/rawhide/f/enable_encoders"
    decoders = "https://src.fedoraproject.org/rpms/ffmpeg/raw/rawhide/f/enable_decoders"

    # Generate the final strings to copy paste into the yaml
    # They are pre-formatted
    print(
        "  encoders: |-\n" + f"    {get_fedora_file(encoders)}" + ",%{extra-encoders}"
    )
    print()
    print(
        "  decoders: |-\n" + f"    {get_fedora_file(decoders)}" + ",%{extra-decoders}"
    )


main()
