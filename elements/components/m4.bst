kind: autotools
description: GNU m4

build-depends:
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst

depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst

variables:
  local_flags: -std=gnu17

sources:
- kind: tar
  url: ftp_gnu_org:m4/m4-1.4.19.tar.xz
  ref: 63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96
