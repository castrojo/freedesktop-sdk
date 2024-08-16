kind: autotools
description: GNU autoconf

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
- bootstrap/zlib.bst
- bootstrap/libxcrypt.bst
- components/m4.bst
- components/perl.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.72.tar.xz
  ref: ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a
