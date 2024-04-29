kind: autotools
description: GNU autoconf

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/perl.bst

(@):
- elements/bootstrap/include/base-sdk.yml

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.72.tar.xz
  ref: ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a
