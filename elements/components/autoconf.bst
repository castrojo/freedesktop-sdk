kind: autotools
description: GNU autoconf

build-depends:
- bootstrap/bootstrap.bst

depends:
- bootstrap/bootstrap-base.bst
- components/m4.bst
- components/perl.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.71.tar.xz
  ref: f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4
