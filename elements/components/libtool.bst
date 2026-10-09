# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU libtool

# Note that public-stacks/runtime-minimal.bst build-depends on this element
# via gcc-libs.bst -> _private/gcc-base.bst. So we have to use bootstrap/
# elements in build-depends, and we cannot use
# public-stacks/runtime-minimal.bst in runtime-depends.

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst
- components/autoconf.bst
- components/automake.bst
- components/m4.bst

runtime-depends:
- components/file.bst
#- public-stacks/runtime-minimal.bst
- components/sed.bst
- components/symlinks.bst
- components/utf-locale.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
        - '%{datadir}/libtool'
        - '%{datadir}/libtool/**'
        - '%{libdir}/libltdl.so'

sources:
- kind: tar
  url: ftp_gnu_org:libtool/libtool-2.6.2.tar.xz
  ref: 2ef1067c16c97db930fd740cc9bc3d3ba9a583804ae5ac42cc3e8719e49e191e
