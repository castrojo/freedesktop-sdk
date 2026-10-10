# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/_private/git-minimal.bst
- components/cython.bst

depends:
- components/python3.bst

environment:
  # -march=native can be problematic and could generate binary that
  # does not work on other builders. It is also not available on
  # ppc64
  ARCHI: generic

sources:
- kind: git_repo
  url: github:Ezibenroc/PyRoaringBitMap.git
  track: refs/tags/*.*.*
  exclude:
  - '*dev*'
  ref: 1.2.0-0-gd6973378a07c995e61d8b4c1a32f5ab1da1f2998
