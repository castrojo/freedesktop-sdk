kind: autotools
description: GNU gettext

(@):
- elements/bootstrap/include/base-sdk.yml
- elements/include/gettext-source.yml

build-depends:
- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/base-sdk/tar.bst

depends:
- bootstrap/base-sdk/binary-seed.bst
