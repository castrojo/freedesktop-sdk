kind: autotools
description: GNU m4

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

(@):
- elements/bootstrap/include/base-sdk.yml
- elements/include/m4-source.yml
