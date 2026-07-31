# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:tox-dev/filelock.git
  track: "*.*.*"
  ref: 3.32.2-0-g9a6cc4365b1e47368bce33ab005beb749983f3e5
