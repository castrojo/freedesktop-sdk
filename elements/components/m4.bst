kind: autotools
description: GNU m4

build-depends:
- bootstrap/bootstrap.bst

depends:
- bootstrap/bootstrap-base.bst

sources:
- kind: tar
  url: ftp_gnu_org:m4/m4-1.4.19.tar.xz
  ref: 63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96
