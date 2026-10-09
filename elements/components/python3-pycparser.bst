# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pycparser.git
  track: release_v*
  ref: release_v3.11-0-gccb34399dedf518baac209592518757f367430fe
