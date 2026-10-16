# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:python-poetry/tomlkit.git
  track: "*.*.*"
  ref: 0.15.2-0-ga0b15ebb09167ede584fc36ad5362fc3039b0530
