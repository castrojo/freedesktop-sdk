#!/usr/bin/env python3
# /// script
# dependencies = [
#   "GitPython",
#   "python-gitlab",
#   "ruamel.yaml",
# ]
# ///

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: LGPL-3.0-or-later

"""Lightweight mirror reachability checker.

Instead of doing a full `bst source fetch` (which clones every git repo
and downloads every file from the mirrors), this script:

- Resolves each `alias:path` URL to its full mirror URL using `include/_private/mirrors.yml`.
- For each unique mirror URL + ref, performs a lightweight reachability check
   via the GitLab API (`python-gitlab`, optionally authenticated with
   `GITLAB_TOKEN` or `~/.netrc`):
   * git mirrors: verifies the commit exists (and the tag too for git-describe refs)
   * file mirrors: verifies the file exists in the repo

If a `GITLAB_TOKEN` (or a `gitlab.com` entry in `~/.netrc`) is provided, it
is used to raise the unauthenticated API rate limit. The token only needs
read access (scopes used: `projects.get`, `commits.get`, `tags.get`,
`files.get`),

Usage::

    python utils/check_mirrors.py <element.bst> [element2.bst ...]
                                  [--workers 4] [--timeout 30] [--delay 2]
"""

import argparse
import logging
import netrc as netrc_module
import os
import re
import sys
import time
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass
from pathlib import Path
from typing import Literal
from urllib.parse import urlparse

import gitlab
from ruamel.yaml import YAML

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
logger = logging.getLogger(__name__)

yaml = YAML(typ="safe")

GIT_KINDS = {"git", "git_repo", "git_module"}
FILE_KINDS = {"tar", "zip", "remote", "cargo", "pypi", "ostree", "anitya", "cpan"}

# Source kinds that have a `url` field we can resolve
URL_SOURCE_KINDS = GIT_KINDS | FILE_KINDS

# Source kinds that have a `path` field (local, not checked)
LOCAL_SOURCE_KINDS = {
    "patch",
    "patch_queue",
    "files",
    "local",
    "script",
    "cargo2",
    "go_mod_vendor",
}
PROJECT_ROOT = Path(__file__).parent.parent
MIRRORS = yaml.load(
    (PROJECT_ROOT / "include" / "_private" / "mirrors.yml").read_text()
)["mirrors"]
MIRRORS = {x["name"]: x["aliases"] for x in MIRRORS}


@dataclass
class SourceUrl:
    url: str
    kind: str
    element: str
    alias: str | None = None
    ref: str | None = None


def netrc_token(host: str) -> str | None:
    """Return the password for `host` from ~/.netrc, or None if not found."""
    try:
        auth = netrc_module.netrc().authenticators(host)
        return auth[2] if auth else None
    except (FileNotFoundError, netrc_module.NetrcParseError):
        return None


def load_yaml_file(path: Path) -> dict | list | None:
    """Load a YAML file, returning the parsed data."""
    with open(path, encoding="utf-8") as f:
        return yaml.load(f)


def extract_sources_from_obj(
    obj,
    element_name: str,
    base_dir: Path,
    parsed_files: set[Path],
    sources: list[SourceUrl],
) -> None:
    """Recursively extract source URLs and transitive dependencies from a
    BuildStream element definition.

    Handles:
    - `sources:` lists with `kind` and `url` fields
    - `(@)` includes
    - `depends:`, `build-depends:`, `runtime-depends:` lists
    - `filename:` entries in depends lists
    - `(?):` conditional blocks (traverse all branches)
    """
    if not isinstance(obj, dict):
        return

    # Handle (?): conditional blocks — traverse all branches
    if "(?)" in obj:
        cond = obj["(?)"]
        if isinstance(cond, list):
            for item in cond:
                if isinstance(item, dict):
                    for branch_val in item.values():
                        extract_sources_from_obj(
                            branch_val, element_name, base_dir, parsed_files, sources
                        )
        elif isinstance(cond, dict):
            for branch_val in cond.values():
                extract_sources_from_obj(
                    branch_val, element_name, base_dir, parsed_files, sources
                )

    # Handle (@): includes
    if "(@)" in obj:
        includes = obj["(@)"]
        if isinstance(includes, list):
            for inc in includes:
                if isinstance(inc, str) and inc.endswith((".yml", ".yaml")):
                    inc_path = (base_dir / inc).resolve()
                    if inc_path in parsed_files:
                        continue
                    if inc_path.is_file():
                        parsed_files.add(inc_path)
                        data = load_yaml_file(inc_path)
                        if data is not None:
                            extract_sources_from_obj(
                                data,
                                element_name,
                                inc_path.parent,
                                parsed_files,
                                sources,
                            )

    # Handle sources: list
    if "sources" in obj and isinstance(obj["sources"], list):
        for src in obj["sources"]:
            if not isinstance(src, dict):
                continue
            kind = src.get("kind", "")
            if kind in URL_SOURCE_KINDS and "url" in src:
                url = src.get("url") or src.get("suffix")
                if isinstance(url, str):
                    if "{version}" in url and kind == "anitya":
                        url = url.replace(
                            "{version}", str(src.get("ref", {}).get("version"))
                        )
                    alias = None
                    if ":" in url and not url.startswith(("http://", "https://")):
                        alias = url.split(":", 1)[0]
                    ref = src.get("ref")
                    if isinstance(ref, dict):
                        ref = ref.get("sha256sum", None)
                    elif not isinstance(ref, str):
                        ref = None
                    sources.append(
                        SourceUrl(
                            url=url,
                            kind=kind,
                            element=element_name,
                            alias=alias,
                            ref=ref,
                        )
                    )
            elif kind not in URL_SOURCE_KINDS | LOCAL_SOURCE_KINDS:
                logger.error(f"Unhandled source plugin {kind} in {element_name}")

    # Handle depends lists (transitive dependencies)
    for dep_key in (
        "depends",
        "build-depends",
        "runtime-depends",
        "build-depends-any",
        "depends-any",
    ):
        if dep_key not in obj or not isinstance(obj[dep_key], list):
            continue
        for dep in obj[dep_key]:
            dep_path: Path | None = None
            if isinstance(dep, str):
                # Direct path reference
                dep_path = (base_dir / dep).resolve()
            elif isinstance(dep, dict):
                # {filename: ..., config: ...} form
                filename = dep.get("filename")
                if isinstance(filename, str):
                    dep_path = (base_dir / filename).resolve()

            if (
                dep_path is not None
                and dep_path not in parsed_files
                and dep_path.is_file()
            ):
                parsed_files.add(dep_path)
                data = load_yaml_file(dep_path)
                if data is not None:
                    extract_sources_from_obj(
                        data, dep_path.name, dep_path.parent, parsed_files, sources
                    )


def collect_source_urls(element_files: list[Path]) -> list[SourceUrl]:
    """Collect all source URLs from the given element files and their
    transitive dependencies."""
    sources: list[SourceUrl] = []
    parsed_files: set[Path] = set()

    for element_file in element_files:
        element_path = (PROJECT_ROOT / element_file).resolve()
        if not element_path.is_file():
            logger.error("Element file not found, skipping: %s", element_file)
            continue
        if element_path in parsed_files:
            continue
        parsed_files.add(element_path)
        data = load_yaml_file(element_path)
        if data is not None:
            extract_sources_from_obj(
                data, element_path.name, element_path.parent, parsed_files, sources
            )

    return sources


def check_project_exists(path: str, gl: gitlab.Gitlab) -> gitlab.Gitlab | None:
    path = urlparse(path).path.strip("/").removesuffix(".git")
    try:
        project = gl.projects.get(path)
        return project
    except gitlab.exceptions.GitlabGetError as e:
        if e.response_code == 404:
            return None
        raise


def check_commit_exists(project, sha: str) -> bool:
    try:
        project.commits.get(sha)
        return True
    except gitlab.exceptions.GitlabGetError as e:
        if e.response_code == 404:
            return False
        raise


def check_tag_exists(project, tag_name: str, sha: str | None = None) -> bool:
    try:
        tag = project.tags.get(tag_name)
        if sha is not None and tag.commit["id"] != sha:
            logger.warning(
                f"{project.name} tag {tag_name} has mismatched sha ({tag.commit['id']}/{sha})"
            )
        return True if sha is None else tag.commit["id"] == sha
    except gitlab.exceptions.GitlabGetError as e:
        if e.response_code == 404:
            return False
        raise


def check_file_exists(project, file_path: str, ref: str = "master") -> bool:
    try:
        project.files.get(
            file_path=file_path.split(f"/-/raw/{ref}/", maxsplit=1)[1], ref=ref
        )
        return True
    except gitlab.exceptions.GitlabGetError as e:
        if e.response_code == 404:
            return False
        raise


def resolve_mirror(alias) -> tuple[Literal["file", "git"], str]:
    if alias in MIRRORS["freedesktop-sdk-git-mirrors"]:
        return "git", MIRRORS["freedesktop-sdk-git-mirrors"][alias][0]
    elif alias in MIRRORS["freedesktop-sdk-raw-file-mirrors"]:
        return "file", MIRRORS["freedesktop-sdk-raw-file-mirrors"][alias][0]
    elif alias in MIRRORS["freedesktop-sdk"]:
        return "git", MIRRORS["freedesktop-sdk"][alias][0]
    raise TypeError(f"Unfound alias {alias}")


def test_references(
    repo: str, refs: list[str], gl, delay: float
) -> tuple[str, str] | None:
    logger.info("Testing %d refs [ %s ] for %s", len(refs), ", ".join(refs), repo)
    alias = repo.split(":", maxsplit=1)[0]
    mirror_type, resolved_alias = resolve_mirror(alias)
    mirror_url = repo.replace(f"{alias}:", resolved_alias)

    if mirror_type == "file":
        project_name = mirror_url.split("/-/", maxsplit=1)[0]
        project = check_project_exists(project_name, gl)
        if project is None:
            logger.warning(f"Mirror does not exist for: {repo} -> {mirror_url}")
            return (repo, "Mirror does not exist")
        if not check_file_exists(project, mirror_url):
            logger.warning(f"File does not exist in {repo}")
            return (repo, f"File does not exist in {project_name}")
            # TODO SHA Testing?? for files
    else:
        for ref in refs:
            sha = None
            tag = None
            project = check_project_exists(mirror_url, gl)

            if project is None:
                logger.warning(f"Mirror does not exist for: {repo} -> {mirror_url}")
                return (repo, "Mirror does not exist")

            if describe := re.match("^(.+)-([0-9]+)-g([0-9a-f]{40})$", ref):
                tag = describe.group(1) if describe.group(2) == "0" else None
                sha = describe.group(3)
            elif re.match("^[0-9a-f]{40}$", ref) or re.match("^[0-9a-f]{64}$", ref):
                sha = ref
            else:
                raise TypeError(f"Unknown ref type: {ref}")

            if tag is not None and not check_tag_exists(project, tag, sha):
                logger.warning(
                    f"Tag {tag}{'@' + sha if sha is not None else ''} does not exist in {mirror_url}"
                )
                return (
                    repo,
                    f"Tag {tag}{'@' + sha if sha is not None else ''} does not exist in {mirror_url}",
                )
            if not check_commit_exists(project, sha):
                logger.warning(f"Commit {sha} does not exist in {mirror_url}")
                return (repo, f"Commit {sha} does not exist in {mirror_url}")
    if delay > 0:
        time.sleep(delay)


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------


def main(args) -> int:

    gl_kwargs = {"timeout": args.timeout}
    if (token := os.environ.get("GITLAB_TOKEN")) or (
        token := netrc_token("gitlab.com")
    ):
        gl_kwargs["private_token"] = token
    gl = gitlab.Gitlab("https://gitlab.com", **gl_kwargs)

    try:
        gl.auth()
    except gitlab.exceptions.GitlabAuthenticationError as e:
        raise ValueError(
            "GitLab authentication failed. Provide a valid GITLAB_TOKEN "
            "or ~/.netrc credentials to avoid unauthenticated API rate limits."
        ) from e
    except gitlab.exceptions.GitlabHttpError as e:
        raise RuntimeError(
            f"Unable to verify GitLab authentication (HTTP {e.response_code})."
        ) from e

    element_files = [Path(e.strip()) for e in args.elements]
    sources: list[SourceUrl] = collect_source_urls(element_files)
    if not sources:
        logger.warning("No source URLs found in the given element files.")
        return 0

    logger.info("Loaded %d mirror definitions", len(MIRRORS))

    seen: dict[str, set[str | None]] = {}
    for src in sources:
        if src.url not in seen:
            seen[src.url] = {src.ref}
        else:
            seen[src.url].add(src.ref)

    failed = []
    logger.info("Total of %d repos to check", len(seen))

    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        failed.extend(
            executor.map(
                lambda item: test_references(
                    item[0], [x for x in item[1] if x is not None], gl, args.delay
                ),
                sorted(seen.items()),
            )
        )
    failed = [x for x in failed if x is not None]
    if failed:
        for repo, msg in failed:
            logger.error(repo + "\n\t-> " + msg)
    else:
        logger.info("All mirrors are reachable.")
    return 1 if len(failed) > 0 else 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Check that all mirror URLs referenced by the given element files are reachable.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    parser.add_argument(
        "elements",
        nargs="+",
        help="Element files to check (e.g. flatpak-release-repo.bst components.bst)",
    )
    parser.add_argument(
        "--workers", type=int, default=4, help="Max concurrent checks (default: 4)"
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=30,
        help="Per-check timeout in seconds (default: 30)",
    )
    parser.add_argument(
        "--delay",
        type=float,
        default=2.0,
        help="Sleep between repo checks in seconds (default: 2.0, 0 to disable)",
    )
    args = parser.parse_args()
    sys.exit(main(args))
