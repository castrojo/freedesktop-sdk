# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/libyaml.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:yaml/pyyaml.git
  track: '*.*.*'
  exclude:
  - "*rc*"
  - "*b*"
  ref: 6.0.3-0-g49790e73684bebad1df05ef8d828fa12f685bffb
