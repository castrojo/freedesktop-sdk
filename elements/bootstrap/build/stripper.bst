# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/bootstrap/include/build.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/build/debugedit-build.bst
- bootstrap/build/dwz-build.bst

sources:
- kind: local
  path: files/stripper
