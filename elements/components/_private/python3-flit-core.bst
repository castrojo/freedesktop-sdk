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
  ref: 3.12.0-0-g1c8141722066ffe1497e511982feeea0f091ddb6
- kind: patch
  path: patches/python3-flit-core/drop-lic-pattern.patch
