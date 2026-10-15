# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/runtime-gnu.bst
- components/_private/python3-build-bootstrap.bst
- components/_private/python3-flit-core.bst
- components/_private/python3-installer-bootstrap.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/installer.git
  track: '*.*.*'
  ref: 1.1.0-0-g509a9b7160decebe9aa0aff429c12837346c86ef
