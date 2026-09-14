kind: autotools
description: GNU autoconf

(@):
- elements/bootstrap/include/base-sdk.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/perl.bst

sources:
- kind: anitya
  project-id: 141
  url: ftp_gnu_org:autoconf/autoconf-{version}.tar.xz
  ref:
    version: '2.72'
    sha256sum: ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a
