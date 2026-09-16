# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/runtime-gnu.bst
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
  ref: 4.1.0-0-g75b1c909d587c1ff5e0fd5f3df1046f74ee249d4
- kind: patch
  path: patches/python3-flit-core/drop-lic-pattern.patch
