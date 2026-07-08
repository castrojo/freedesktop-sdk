#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import argparse
import re
import sys
from functools import cmp_to_key
from io import StringIO
from pathlib import Path
from typing import Any

from ruamel.yaml import YAML
from ruamel.yaml.comments import CommentedMap, CommentedSeq

TOP_LEVEL_ORDER = [
    "kind",
    "description",
    "(@)",
    "build-depends",
    "depends",
    "runtime-depends",
    "(?)",
    "environment",
    "environment-nocache",
    "variables",
    "config",
    "public",
    "sources",
]

DEPENDENCY_KEYS = {"build-depends", "depends", "runtime-depends"}
PLAIN_MULTILINE_SCALAR_RE = re.compile(
    r"(?m)^"
    r"(?P<indent> *)"
    r"(?P<key>[A-Za-z0-9_-]+:)\n"
    r"(?P<value>(?:(?P=indent)  (?!- )[^#:\n]+\n)+)"
)


def comment_entry_has_text(entry: Any) -> bool:
    if not entry:
        return False

    if isinstance(entry, list):
        return any(comment_entry_has_text(item) for item in entry)

    return bool(getattr(entry, "value", "").strip())


def node_has_attached_comments(node: Any) -> bool:
    comments = getattr(node, "ca", None)
    if comments is None:
        return False

    return any(comment_entry_has_text(entry) for entry in comments.items.values())


def top_level_sort_key(key: Any) -> tuple[int, str]:
    key_string = str(key)
    if key_string == "sources":
        return 999, key_string
    try:
        return TOP_LEVEL_ORDER.index(key_string), key_string
    except ValueError:
        return 500, key_string


def dependency_sort_key(item: Any) -> tuple[int, str]:
    if isinstance(item, str):
        filename = item
    elif isinstance(item, dict) and isinstance(item.get("filename"), str):
        filename = item["filename"]
    else:
        return 99, repr(item)

    if filename.startswith("public-stacks/"):
        group = 0
    elif filename.startswith("bootstrap/"):
        group = 1
    elif filename.startswith("components/_private/"):
        group = 2
    elif filename.startswith("components/"):
        group = 3
    else:
        group = 4

    return group, filename.removesuffix(".bst")


def compare_dependency_items(left: Any, right: Any) -> int:
    left_group, left_name = dependency_sort_key(left)
    right_group, right_name = dependency_sort_key(right)

    if left_group != right_group:
        return -1 if left_group < right_group else 1

    # Keep related variants before their base component.  For example, the
    # established ordering is liba1.bst before liba.bst.
    if left_name.startswith(right_name) and left_name != right_name:
        return -1
    if right_name.startswith(left_name) and left_name != right_name:
        return 1
    return (left_name > right_name) - (left_name < right_name)


def reorder_commented_map(data: CommentedMap, ordered_keys: list[Any]) -> None:
    for key in reversed(ordered_keys):
        data.move_to_end(key, last=False)


def comment_text(comment: Any) -> str:
    value = getattr(comment, "value", "")
    lines = []
    for line in value.splitlines():
        line = line.strip()
        if line.startswith("#"):
            lines.append(line[1:].strip())
    return "\n".join(lines)


def comment_has_blank_line(comment: Any) -> bool:
    value = getattr(comment, "value", "")
    return "\n\n" in value


def format_dependency_list(data: CommentedSeq) -> None:
    if node_has_attached_comments(data):
        return

    items = list(data)
    blocks: list[list[Any]] = [[]]
    block_comments: dict[int, list[str]] = {}
    for index, item in enumerate(items):
        blocks[-1].append(item)
        entry = data.ca.items.get(index)
        if entry and entry[0] and comment_has_blank_line(entry[0]):
            blocks.append([])
            post_comment = comment_text(entry[0])
            if post_comment:
                block_comments[len(blocks) - 1] = [post_comment]

    blocks = [block for block in blocks if block]
    sorted_blocks = [
        sorted(block, key=cmp_to_key(compare_dependency_items)) for block in blocks
    ]
    sorted_items = [item for block in sorted_blocks for item in block]
    if items == sorted_items:
        return

    comments: dict[int, list[str]] = {}
    for index, item in enumerate(items):
        entry = data.ca.items.get(index)
        if not entry:
            continue

        pre_comment = comment_text(entry[1][0]) if entry[1] else ""
        if pre_comment:
            comments.setdefault(id(item), []).append(pre_comment)

        post_comment = comment_text(entry[0]) if entry[0] else ""
        if post_comment and not comment_has_blank_line(entry[0]):
            target = items[index + 1] if index + 1 < len(items) else item
            comments.setdefault(id(target), []).append(post_comment)

    data.clear()
    data.ca.items.clear()

    for block_index, block in enumerate(sorted_blocks):
        for item_index, item in enumerate(block):
            index = len(data)
            data.append(item)
            item_comments = list(comments.get(id(item), []))
            if block_index and item_index == 0:
                before = "\n" + "\n".join(block_comments.get(block_index, []))
                if item_comments:
                    before += "\n" + "\n".join(item_comments)
                data.yaml_set_comment_before_after_key(index, before=before)
            elif item_comments:
                data.yaml_set_comment_before_after_key(
                    index, before="\n".join(item_comments)
                )


def format_node(node: Any, *, is_top_level: bool = False) -> None:
    if isinstance(node, CommentedMap):
        for key, value in list(node.items()):
            if key in DEPENDENCY_KEYS and isinstance(value, CommentedSeq):
                format_dependency_list(value)
            format_node(value)

        if is_top_level and all(isinstance(key, str) for key in node):
            reorder_commented_map(node, sorted(node, key=top_level_sort_key))
    elif isinstance(node, list):
        for item in node:
            format_node(item)


def add_top_level_spacing(text: str) -> str:
    lines = text.splitlines()
    result: list[str] = []

    for line in lines:
        is_top_level_key = (
            line
            and not line[0].isspace()
            and line.endswith(":")
            and not line.startswith("-")
        )
        if (
            is_top_level_key
            and result
            and result[-1] != ""
            and not result[-1].lstrip().startswith("#")
        ):
            result.append("")
        result.append(line)

    return "\n".join(result).rstrip() + "\n"


def protected_plain_multiline_scalars(text: str) -> list[tuple[str, str]]:
    protected: list[tuple[str, str]] = []

    for match in PLAIN_MULTILINE_SCALAR_RE.finditer(text):
        key = f"{match.group('indent')}{match.group('key')}"
        value = " ".join(
            line.strip() for line in match.group("value").splitlines() if line.strip()
        )
        if value:
            protected.append((f"{key} {value}\n", match.group(0)))

    return protected


def restore_plain_multiline_scalars(text: str, original: str) -> str:
    for formatted_line, original_block in protected_plain_multiline_scalars(original):
        text = text.replace(formatted_line, original_block, 1)
    return text


def dump_bst(data: Any, original: str) -> str:
    yaml = YAML()
    yaml.preserve_quotes = True
    yaml.default_flow_style = False
    yaml.boolean_representation = ["False", "True"]
    yaml.indent(mapping=2, sequence=2, offset=0)
    yaml.width = 4096

    output = StringIO()
    yaml.dump(data, output)
    return restore_plain_multiline_scalars(
        add_top_level_spacing(output.getvalue()), original
    )


def read_bst(path: Path) -> Any:
    yaml = YAML()
    yaml.preserve_quotes = True
    with path.open("r", encoding="utf-8") as input_file:
        return yaml.load(input_file)


def format_file(path: Path, *, check: bool = False) -> bool:
    original = path.read_text(encoding="utf-8")
    data = read_bst(path)
    format_node(data, is_top_level=True)
    formatted = dump_bst(data, original)
    if formatted == original:
        return False

    if check:
        print(f"{path}: formatting required", file=sys.stderr)
        return True

    path.write_text(formatted, encoding="utf-8")
    return True


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Format BuildStream .bst files using freedesktop-sdk conventions.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Check whether files are formatted without modifying them",
    )
    parser.add_argument(
        "files", nargs="+", type=Path, help="BuildStream files to format"
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    changed = False

    for path in args.files:
        if not path.exists():
            print(f"{path}: does not exist", file=sys.stderr)
            return 2
        if path.suffix != ".bst":
            print(f"{path}: expected a .bst file", file=sys.stderr)
            return 3

        changed |= format_file(path, check=args.check)
    return 1 if args.check and changed else 0


if __name__ == "__main__":
    raise SystemExit(main())
