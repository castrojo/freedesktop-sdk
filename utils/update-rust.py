#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

# /// script
# requires-python = ">=3.11"
# dependencies = [
#   "ruamel.yaml>=0.18",
# ]
# ///

import argparse
import logging
import os
import re
import urllib.request
from collections.abc import Callable
from typing import Any
from urllib.error import URLError

import tomllib
from ruamel.yaml import YAML
from ruamel.yaml.error import YAMLError

log = logging.getLogger(__name__)

MANIFEST_URL = "https://static.rust-lang.org/dist/channel-rust-stable.toml"
BOOTSTRAP_MANIFEST_URL = "https://static.rust-lang.org/dist/channel-rust-{version}.toml"

ROOT = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
RUST_SOURCE_FILE = os.path.join(ROOT, "elements/include/rust-source.yml")
STAGE1_DIR = os.path.join(ROOT, "elements/components/_private")

STAGE1_TARGETS: dict[str, str] = {
    "aarch64-unknown-linux-gnu": "rust-stage1-aarch64.bst",
    "i686-unknown-linux-gnu": "rust-stage1-i686.bst",
    "loongarch64-unknown-linux-gnu": "rust-stage1-loongarch64.bst",
    "powerpc64le-unknown-linux-gnu": "rust-stage1-powerpc64le.bst",
    "riscv64gc-unknown-linux-gnu": "rust-stage1-riscv64.bst",
    "x86_64-unknown-linux-gnu": "rust-stage1-x86_64.bst",
}

Manifest = dict[str, Any]

yaml = YAML()
yaml.preserve_quotes = True


def fetch_manifest(url: str) -> Manifest | None:
    try:
        with urllib.request.urlopen(url) as f:
            manifest: Manifest = tomllib.loads(f.read().decode())
        manifest_ver = manifest.get("manifest-version")
        if manifest_ver != "2":
            log.error("Unsupported manifest version: %s", manifest_ver)
            return None
    except URLError as e:
        log.error("Failed to download manifest %s: %s", url, e)
    except tomllib.TOMLDecodeError as e:
        log.error("Failed to parse manifest %s: %s", url, e)
    else:
        return manifest
    return None


def parse_version(version: str) -> tuple[int, int, int] | None:
    m = re.fullmatch(r"(\d+)\.(\d+)\.(\d+)", version)
    if not m:
        log.error("Failed to parse version: %s", version)
        return None
    return int(m.group(1)), int(m.group(2)), int(m.group(3))


def rust_version(manifest: Manifest) -> str:
    return str(manifest["pkg"]["rustc"]["version"].split()[0])


def bootstrap_version(version: str) -> str | None:
    parsed = parse_version(version)
    if parsed is None:
        log.error("Failed to parse bootstrap version: %s", version)
        return None
    major, minor, _ = parsed
    return f"{major}.{minor - 1}.0"


def current_version() -> str | None:
    if not os.path.exists(RUST_SOURCE_FILE):
        return None

    with open(RUST_SOURCE_FILE, encoding="utf-8") as f:
        m = re.search(r"rustc-([0-9]+\.[0-9]+\.[0-9]+)-src", f.read())

    if not m:
        log.error("Failed to read current version from %s", RUST_SOURCE_FILE)
        return None

    return m.group(1)


def rust_src_sha(manifest: Manifest) -> str | None:
    for entry in manifest["artifacts"]["source-code"]["target"]["*"]:
        if entry["url"].endswith(".tar.xz"):
            return str(entry["hash-sha256"])

    log.error("Failed to find rustc source tar.xz in manifest")
    return None


def stage1_sha(manifest: Manifest, target: str) -> tuple[str, str] | None:
    try:
        pkg = manifest["pkg"]["rust"]["target"][target]
        return pkg["xz_url"], pkg["xz_hash"]
    except KeyError:
        log.error("Missing stage1 package for target %s", target)
        return None


def load_yaml(path: str) -> Any | None:
    try:
        with open(path, encoding="utf-8") as f:
            return yaml.load(f)
    except YAMLError as e:
        log.error("Failed to parse %s: %s", path, e)
        return None


def dump_yaml(path: str, data: Any) -> bool:
    try:
        with open(path, "w", encoding="utf-8") as f:
            yaml.dump(data, f)
    except YAMLError as e:
        log.error("Failed to write %s: %s", path, e)
        return False
    else:
        return True


def update_elements(
    version: str, src_sha: str, stage1_shas: dict[str, str], bootstrap: str
) -> bool:
    files: list[tuple[str, Callable[[str], str], str]] = [
        (
            RUST_SOURCE_FILE,
            lambda u: re.sub(
                r"rustc-[0-9]+\.[0-9]+\.[0-9]+-src", f"rustc-{version}-src", u
            ),
            src_sha,
        )
    ] + [
        (
            os.path.join(STAGE1_DIR, filename),
            lambda u: re.sub(r"rust-[0-9]+\.[0-9]+\.[0-9]+-", f"rust-{bootstrap}-", u),
            stage1_shas[target],
        )
        for target, filename in STAGE1_TARGETS.items()
    ]

    for path, rewrite_url, sha in files:
        doc = load_yaml(path)
        if doc is None:
            return False

        for source in doc["sources"]:
            if source.get("kind") == "tar":
                source["url"] = rewrite_url(source["url"])
                source["ref"] = sha
                break

        if not dump_yaml(path, doc):
            return False

    return True


def run() -> int:
    manifest = fetch_manifest(MANIFEST_URL)
    if manifest is None:
        return 1

    version = rust_version(manifest)

    sha = rust_src_sha(manifest)
    if sha is None:
        return 1

    parsed_new = parse_version(version)
    if parsed_new is None:
        return 1

    old_version = current_version()
    if old_version is None:
        return 1

    parsed_old = parse_version(old_version)
    if parsed_old is None:
        return 1

    if parsed_new <= parsed_old:
        log.error("Refusing to downgrade or re-apply: %s -> %s", old_version, version)
        return 1

    bootstrap = bootstrap_version(version)
    if bootstrap is None:
        return 1

    bootstrap_manifest = fetch_manifest(
        BOOTSTRAP_MANIFEST_URL.format(version=bootstrap)
    )
    if bootstrap_manifest is None:
        return 1

    stage1_shas: dict[str, str] = {}

    for target in STAGE1_TARGETS:
        result = stage1_sha(bootstrap_manifest, target)
        if result is None:
            return 1
        _, sha1 = result
        stage1_shas[target] = sha1

    log.info(
        "Rust: %s -> %s (bootstrap: %s)", old_version or "unknown", version, bootstrap
    )

    if not update_elements(version, sha, stage1_shas, bootstrap):
        return 1

    return 0


def main() -> int:
    logging.basicConfig(format="%(message)s", level=logging.INFO)
    parser = argparse.ArgumentParser(
        description="A script to update sources in rust and rust bootstrap elements",
        formatter_class=argparse.RawTextHelpFormatter,
        usage=argparse.SUPPRESS,
        add_help=False,
    )
    parser.add_argument(
        "-h", "--help", action="help", help="Show this help message and exit"
    )
    parser.add_argument(
        "--update",
        action="store_true",
        help="Update Rust sources and bootstrap elements",
    )

    args = parser.parse_args()

    if not args.update:
        parser.print_help()
        return 0

    return run()


if __name__ == "__main__":
    raise SystemExit(main())
