# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-wheel.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/pip.git
  track: "*"
  exclude:
  - "*b*"
  ref: 26.2.2-0-gb3b696fe2122f2339d782517559bfade2cb6b879
- kind: patch
  path: patches/python3-pip/0001-Allow-flit-core-4-to-build-pip.patch
