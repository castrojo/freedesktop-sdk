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
  url: github:sphinx-doc/sphinxcontrib-devhelp.git
  track: "*.*.*"
  ref: 2.0.0-0-g0177fb44f165305f27b34e69e6e7e5ed6f24d752
