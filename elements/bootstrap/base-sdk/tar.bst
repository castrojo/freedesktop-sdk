kind: autotools

(@):
- elements/bootstrap/include/base-sdk.yml
- elements/include/tar-source.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst
