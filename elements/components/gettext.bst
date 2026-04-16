# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU gettext

(@):
- elements/include/gettext-source.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst

runtime-depends:
- bootstrap/diffutils.bst
- bootstrap/findutils.bst
- components/gzip.bst
- components/tar.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/autopoint'
        - '%{bindir}/gettextize'
        - '%{libdir}/gettext/*'
        - '%{libdir}/libgettextsrc.so'
        - '%{libdir}/libgettextlib.so'
        - '%{libdir}/libgettextpo.so'
        - '%{libdir}/libasprintf.so'
        - '%{libdir}/libtextstyle.so'
        - '%{libdir}/preloadable_libintl.so'
        - '%{datadir}/gettext/projects'
        - '%{datadir}/gettext/projects/**'
        - '%{datadir}/gettext/archive.dir.tar.bz2'
        - '%{datadir}/gettext/config.rpath'
        - '%{datadir}/gettext/gettext.h'
        - '%{datadir}/gettext/javaversion.class'
        - '%{datadir}/gettext/msgunfmt.tcl'
