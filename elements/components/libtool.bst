kind: autotools
description: GNU libtool

build-depends:
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/stripper.bst
- components/automake.bst
- components/autoconf.bst
- components/m4.bst

depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/file.bst
- bootstrap/glibc.bst
- bootstrap/sed.bst
- bootstrap/symlinks.bst
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
