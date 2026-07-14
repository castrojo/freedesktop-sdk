# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: zlib

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
- bootstrap/glibc.bst

environment:
  CHOST: '%{triplet}'

variables:
  conf-args: >-
    --prefix=%{prefix}
    --sharedlibdir=%{libdir}
    --libdir=%{libdir}
    --zlib-compat
    --without-new-strategies

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libz.so'

  cpe:
    vendor: zlib-ng

sources:
- kind: git_repo
  url: github:zlib-ng/zlib-ng.git
  track: "*.*.*"
  exclude:
  - "*rc*"
  ref: 2.3.3-0-g12731092979c6d07f42da27da673a9f6c7b13586
