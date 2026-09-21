# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:ultrajson/ultrajson.git
  track: '*.*.*'
  ref: 6.0.0-0-g12492c2deb0e60ac66da40dc15f06ba967ed3e0a
