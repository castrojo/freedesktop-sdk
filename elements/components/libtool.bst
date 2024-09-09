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
- public-stacks/runtime-minimal.bst
- bootstrap/sed.bst

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
  url: ftp_gnu_org:libtool/libtool-2.4.7.tar.xz
  ref: 4f7f217f057ce655ff22559ad221a0fd8ef84ad1fc5fcb6990cecc333aa1635d
