# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst

depends:
- components/libffi.bst
- components/python3-pycparser.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:python-cffi/cffi.git
  track: v*
  exclude:
  - "*rc*"
  - "*b*"
  ref: v2.1.1-0-gfd33e7700f0ebafe6f30bd5053f13327221b77a2
