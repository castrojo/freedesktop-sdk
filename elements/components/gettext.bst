kind: autotools
description: GNU gettext

build-depends:
- bootstrap/gcc.bst

depends:
- bootstrap/acl.bst
- bootstrap/attr.bst
- bootstrap/bash.bst
- bootstrap/bzip2.bst
- bootstrap/binutils.bst
- bootstrap/coreutils.bst
- bootstrap/debugedit.bst
- bootstrap/diffutils.bst
- bootstrap/dwz.bst
- bootstrap/elfutils.bst
- bootstrap/file.bst
- bootstrap/findutils.bst
- bootstrap/gawk.bst
- bootstrap/glibc.bst
- bootstrap/gnu-config.bst
- bootstrap/grep.bst
- bootstrap/stripper.bst
- bootstrap/linux-headers.bst
- bootstrap/make.bst
- bootstrap/ncurses.bst
- bootstrap/pcre2.bst
- bootstrap/readline.bst
- bootstrap/sed.bst
- bootstrap/symlinks.bst
- bootstrap/utf-locale.bst
- components/gzip.bst

runtime-depends:
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

(@):
- elements/include/gettext-source.yml
