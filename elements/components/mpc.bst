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
- components/mpfr.bst
- components/utf-locale.bst

variables:
  make-args: >-
    MAKEINFO=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmpc.so'

sources:
- kind: git_repo
  url: inria:mpc/mpc.git
  track: '*.*.*'
  ref: 1.4.1-0-g532a18ae8222f928c58f7ffd1b4f0122062172bd
