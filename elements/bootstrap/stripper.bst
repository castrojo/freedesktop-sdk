# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/debugedit.bst
- bootstrap/dwz.bst
- bootstrap/glibc.bst
- bootstrap/xz.bst

environment:
  CXX: "%{triplet}-g++"

public:
  bst:
    split-rules:
      devel:
        (>):
        - "/**"

sources:
- kind: local
  path: files/stripper
