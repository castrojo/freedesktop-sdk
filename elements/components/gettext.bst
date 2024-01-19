kind: autotools
description: GNU gettext

build-depends:
- bootstrap/bootstrap.bst

depends:
- bootstrap/bootstrap-base.bst
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
