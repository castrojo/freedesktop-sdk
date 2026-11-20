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
    version: 1.20
    sha256sum: f6f34dad4cbe395715762b0710f7c511e39bd5cf777e6b95818ccbecf7714248
