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
  url: ftp_gnu_org:libtool/libtool-2.5.4.tar.xz
  ref: f81f5860666b0bc7d84baddefa60d1cb9fa6fceb2398cc3baca6afaa60266675
