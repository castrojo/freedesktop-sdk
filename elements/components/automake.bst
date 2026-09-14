# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU automake

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst
- components/autoconf.bst
- components/m4.bst

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/perl.bst
- components/utf-locale.bst

sources:
- kind: anitya
  project-id: 144
  url: ftp_gnu_org:automake/automake-{version}.tar.xz
  ref:
    version: 1.18.1
    sha256sum: 168aa363278351b89af56684448f525a5bce5079d0b6842bd910fdd3f1646887
