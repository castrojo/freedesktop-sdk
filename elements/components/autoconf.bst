kind: autotools
description: GNU autoconf

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst

depends:
- bootstrap/gawk.bst
- bootstrap/glibc.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst
- components/m4.bst
- components/perl.bst

runtime-depends:
- components/gettext.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.73.tar.xz
  ref: 9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e
