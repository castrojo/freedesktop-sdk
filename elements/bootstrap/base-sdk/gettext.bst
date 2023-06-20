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
- elements/include/gettext-source.yml
