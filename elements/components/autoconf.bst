kind: autotools
description: GNU autoconf

build-depends:
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/gawk.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- components/m4.bst
- components/perl.bst

runtime-depends:
- components/gettext.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.72.tar.xz
  ref: ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a
