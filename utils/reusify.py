#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import argparse
import sys
from pathlib import Path


LINE_COMMENTS = {
    ".bst": "#",
    ".conf": "#",
    ".c": "//",
    ".cc": "//",
    ".cpp": "//",
    ".h": "//",
    ".hh": "//",
    ".hpp": "//",
    ".hxx": "//",
    ".js": "//",
    ".py": "#",
    ".sh": "#",
    ".toml": "#",
    ".yaml": "#",
    ".yml": "#",
    "Makefile": "#",
}


def read_header(root: Path) -> str:
    return (root / "reuse-header").read_text(encoding="utf-8").strip()


def comment_header(path: Path, header: str) -> str:
    if len(path.suffix) == 0:
        comment = LINE_COMMENTS.get(path.name)
    else:
        comment = LINE_COMMENTS.get(path.suffix)

    if comment is not None:
        return "\n".join(f"{comment} {line}" for line in header.splitlines()) + "\n\n"

    raise ValueError(f"Unsupported comment style for {path}")


def has_inline_style(path: Path) -> bool:
    return path.name == "Makefile" or path.suffix in LINE_COMMENTS


def split_shebang(text: str) -> tuple[str, str]:
    if not text.startswith("#!"):
        return "", text

    shebang, _, rest = text.partition("\n")
    return shebang + "\n\n", rest.lstrip("\n")


def has_header(text: str, header: str) -> bool:
    head = text[:1000]
    return all(line in head for line in header.splitlines())


def add_header(path: Path, header: str) -> bool:
    if path.suffix == ".patch" or not has_inline_style(path):
        sidecar = path.with_name(path.name + ".license")
        if sidecar.exists() and header in sidecar.read_text(encoding="utf-8"):
            return False
        sidecar.write_text(header + "\n", encoding="utf-8")
        return True

    text = path.read_text(encoding="utf-8")
    if has_header(text, header):
        return False

    shebang, rest = split_shebang(text)
    path.write_text(shebang + comment_header(path, header) + rest, encoding="utf-8")
    return True


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("files", nargs="+", type=Path)
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[1]
    header = read_header(root)
    changed = 0

    for path in args.files:
        try:
            changed += add_header(path, header)
        except UnicodeDecodeError:
            print(f"Skipping non-text file: {path}", file=sys.stderr)

    print(f"Updated {changed} file(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
