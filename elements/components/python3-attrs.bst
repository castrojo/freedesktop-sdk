# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-fancy-pypi-readme.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:python-attrs/attrs.git
  track: '*.*.*'
  ref: 26.1.0-0-g7bfc49e9b22d5ba25b6e429524c3d49fee27cb36
