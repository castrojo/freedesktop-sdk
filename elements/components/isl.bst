# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst
- components/_private/python3-minimal.bst
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst
- components/m4.bst

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/gmp.bst
- components/utf-locale.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libisl.so'

sources:
- kind: git_repo
  url: git_https:repo.or.cz/isl.git
  track: 'isl-*'
  ref: isl-0.28-0-g6c2b19a0405759f4d31bf48b73492be4a2b1d813
