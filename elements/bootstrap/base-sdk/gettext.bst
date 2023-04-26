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
  url: ftp_gnu_org:gettext/gettext-0.21.1.tar.lz
  ref: 53ae95b7ac8b6f6996a85076cf4f7c8b32c8c4027387b7b989dd0796333c8c8f
