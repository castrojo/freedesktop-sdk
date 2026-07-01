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
  url: github:pygments/pygments.git
  track: refs/tags/*.*.*
  ref: 2.20.0-0-g708197d82827ba2d5ca78bcbb653c7102ce86dcd
- kind: patch_queue
  path: patches/python3-pygments
