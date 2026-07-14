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
  url: github:sphinx-doc/sphinxcontrib-applehelp.git
  track: "*.*.*"
  ref: 2.0.0-0-gf4f9d900b238d03da601bf7c75cff5bcbcee6d7c
