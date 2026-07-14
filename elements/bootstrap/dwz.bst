# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/dwz-source.yml

build-depends:
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- filename: bootstrap/elfutils.bst
  config:
    location: "%{sysroot}"

- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"
- bootstrap/gnu-config.bst
- filename: bootstrap/xxhash.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/elfutils.bst
- bootstrap/glibc.bst
- bootstrap/xxhash.bst

variables:
  make-args: >-
    CC='%{triplet}-gcc'
    CFLAGS="${CFLAGS}"
    CXXFLAGS="${CXXFLAGS}"
    LDFLAGS="${LDFLAGS}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - "/**"
