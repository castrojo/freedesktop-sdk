# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst
- components/m4.bst

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/gmp.bst
- components/utf-locale.bst

variables:
  make-args: >-
    MAKEINFO=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmpfr.so'

sources:
- kind: git_repo
  url: inria:mpfr/mpfr.git
  track: '*.*.*'
  exclude:
  - '*-rc*'
  ref: 4.2.2-0-geaa57b856d814af32f97d5e5eb129fb986235323
