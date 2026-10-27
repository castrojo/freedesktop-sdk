#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: LGPL-3.0-or-later

import argparse
import json
import sys
from pathlib import Path


def get_bst_element(package):
    """Return the BuildStream element path from an SPDX package."""
    for ref in package.get("externalRefs", []):
        if (
            ref.get("referenceCategory") == "OTHER"
            and ref.get("referenceType") == "bst-element"
        ):
            return ref["referenceLocator"]
    return None


SOURCE_TYPES = {
    "local": ("dir", "path"),
    "patch": ("patch", "path"),
    "patch_queue": ("patch", "path"),
    "git_repo": ("git", "url"),
    "git_module": ("git", "url"),
    "cargo2": ("archive", "url"),
    "cpan": ("archive", "url"),
    "docker": ("docker", "url"),
    "pypi": ("archive", "url"),
    "remote": ("archive", "url"),
    "tar": ("archive", "url"),
    "zip": ("archive", "url"),
}


def make_source(package):
    source_info = package.get("sourceInfo")
    download = package.get("downloadLocation")

    if not download or download in ("NOASSERTION", "NONE"):
        return None

    source_type, field = SOURCE_TYPES.get(source_info, ("archive", "url"))

    # Local source paths use "path"; other source types use "url".
    source = {"type": source_type, field: download}

    if source_type != "patch":
        source["x-cpe"] = {"product": package.get("name", "")}

    return source


def convert(spdx):
    modules = {}

    for package in spdx.get("packages", []):
        element = get_bst_element(package)
        if element is None:
            continue

        module = modules.setdefault(element, {"name": element, "sources": []})

        source = make_source(package)

        if source not in module["sources"] and source is not None:
            module["sources"].append(source)

    return {"modules": list(modules.values())}


def main():
    parser = argparse.ArgumentParser(
        description="Convert an SPDX JSON SBOM to a manifest.json."
    )
    parser.add_argument("input", type=Path, help="Input SPDX JSON file")
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        default=Path("manifest.json"),
        help="Output manifest path (default: manifest.json)",
    )
    args = parser.parse_args()

    try:
        with args.input.open(encoding="utf-8") as f:
            spdx = json.load(f)

        manifest = convert(spdx)
        args.output.parent.mkdir(exist_ok=True, parents=True)
        with args.output.open("w", encoding="utf-8") as f:
            json.dump(manifest, f, indent=2)
            f.write("\n")

    except (OSError, json.JSONDecodeError, KeyError) as exc:
        print(f"Error: {exc}", file=sys.stderr)
        return 1

    print(f"Wrote {len(manifest['modules'])} modules to {args.output}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
