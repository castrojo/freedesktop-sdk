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
  url: github:sphinx-doc/sphinxcontrib-htmlhelp.git
  track: "*.*.*"
  ref: 2.1.0-0-gf7f5d4ecf27fad97e2454fbeda94c6a105c994ff
