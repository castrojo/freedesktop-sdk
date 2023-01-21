kind: autotools
description: GNU libtool

build-depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

(@):
- elements/bootstrap/include/base-sdk.yml

sources:
- kind: tar
  url: ftp_gnu_org:libtool/libtool-2.4.6.tar.xz
  ref: 7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f
