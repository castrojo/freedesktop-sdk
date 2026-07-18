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
  ref: v2.1.20-0-g8a6ed8c7f28a3f12fabc9c2deb8393587288821c
- kind: git_module
  path: src/ext/uchardet
  url: github:PyYoshi/uchardet.git
  ref: bdb8a0376ddf5d3cab6397be0bad98dad106d77f
- kind: patch
  path: patches/python3-faust-cchardet/repro.patch
- kind: patch
  path: patches/python3-faust-cchardet/0001-Revert-packaging-version-constraint.patch
