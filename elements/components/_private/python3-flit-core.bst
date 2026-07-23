# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/_private/python3-build-bootstrap.bst
- components/_private/python3-installer-bootstrap.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: flit_core
  strip-binaries: ''

config:
  build-commands:
    # Unvendoring
    (<):
    - rm -r flit_core/vendor

sources:
- kind: git_repo
  url: github:pypa/flit.git
  track: '*.*.*'
  ref: 4.0.0-0-gef7f31925305a50bd097f06b913717192490ad44
- kind: patch
  path: patches/python3-flit-core/drop-lic-pattern.patch
