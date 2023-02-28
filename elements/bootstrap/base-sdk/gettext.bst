kind: autotools
description: GNU gettext

build-depends:
- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/base-sdk/tar.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

(@):
- elements/bootstrap/include/base-sdk.yml

sources:
- kind: tar
  url: ftp_gnu_org:gettext/gettext-0.21.tar.lz
  ref: 435b546e3880ab767c967c0731b20629a0cb0ba620e6bac2f590f401c10ebb45
