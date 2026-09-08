# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/pyproject-metadata.git
  track: '*.*.*'
  ref: 0.12.1-0-g737644a1482a750ce8a38927b69bbbe07d4e8b65
