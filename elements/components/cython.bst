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
  ref: 3.3.0-0-gbcd04a2966842d80de6ecff4e68e8d892bec5ef7
- kind: patch
  path: patches/cython/sort-shared-exports.patch
- kind: patch
  path: patches/cython/ordered-type-inference.patch
- kind: patch
  path: patches/cython/flowcontrol-state-type.patch
