# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:leohemsted/smartypants.py.git
  track: v*
  ref: v2.0.2-0-gf1266cfbe42c7f85d96c329d4b8a1dba017f3efa
