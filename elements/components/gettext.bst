kind: autotools
description: GNU gettext

build-depends:
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst

depends:
- public-stacks/runtime-minimal.bst 

runtime-depends:
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

(@):
- elements/include/gettext-source.yml
