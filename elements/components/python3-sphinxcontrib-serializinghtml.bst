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
  url: github:sphinx-doc/sphinxcontrib-serializinghtml.git
  track: "*.*.*"
  ref: 2.0.0-0-gf0f3b15b2e6bb47570d605ebd5687643d7a85b9d
