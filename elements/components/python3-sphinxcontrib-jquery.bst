# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3-sphinx.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:sphinx-contrib/jquery.git
  track: v*
  ref: v4.1-0-gf45993d5657e2afb96e4a730b9033673af7ab0ef
