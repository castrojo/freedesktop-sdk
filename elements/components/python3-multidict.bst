# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/multidict.git
  track: v*
  exclude:
  - "*a*"
  ref: v6.9.0-0-g087fbed9c99cbbca05b297a698f970f14410f1e4
