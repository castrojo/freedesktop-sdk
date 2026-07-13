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
  ref: v2.1.0-0-gd9f6f70adac5ca9f260abf5405cf4d0373767b65
