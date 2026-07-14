# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-pkgconfig.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:faust-streaming/cChardet.git
  track: '*.*.*'
  ref: v2.1.19-0-g3ab4c8b6c82559ecb03a623a825fa3c5c08e5ec8
- kind: git_module
  path: src/ext/uchardet
  url: github:PyYoshi/uchardet.git
  ref: bdb8a0376ddf5d3cab6397be0bad98dad106d77f
- kind: patch
  path: patches/python3-faust-cchardet/repro.patch
