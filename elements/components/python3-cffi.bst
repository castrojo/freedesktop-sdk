# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst

depends:
- components/libffi.bst
- components/python3.bst
- components/python3-pycparser.bst

sources:
- kind: git_repo
  url: github:python-cffi/cffi.git
  track: v*
  exclude:
  - "*rc*"
  - "*b*"
  ref: v2.0.0-0-g6366c01d84e9a78e7e85f12ebe9760ba5d19b6d3
