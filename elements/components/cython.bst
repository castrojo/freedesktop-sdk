# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cython/cython.git
  track: '*.*.*'
  exclude:
  - "*a*"
  - "*rc*"
  - "*b*"
  ref: 3.3.1-0-g59e1b91224c973f5e32a49fe802253b0e93b896a
- kind: patch
  path: patches/cython/sort-shared-exports.patch
- kind: patch
  path: patches/cython/ordered-type-inference.patch
- kind: patch
  path: patches/cython/flowcontrol-state-type.patch
