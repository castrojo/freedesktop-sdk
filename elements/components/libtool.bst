kind: autotools
description: GNU libtool

build-depends:
- bootstrap/gcc.bst
- components/m4.bst

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
