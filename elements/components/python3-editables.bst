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
  url: github:pfmoore/editables.git
  track: "*.*"
  ref: 0.6-0-g6bb75a27a5177825e4e178a8f02421802c654b40
