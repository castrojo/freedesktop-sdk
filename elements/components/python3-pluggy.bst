# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pytest-dev/pluggy.git
  track: "*.*.*"
  exclude:
  - "*dev*"
  ref: 1.7.0-0-g4c7f6365f2dde09c11e72db67d0f615231d64c19
