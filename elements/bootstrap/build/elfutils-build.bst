kind: autotools

build-depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/zstd.bst

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/elfutils-source.yml

variables:
  conf-local: >-
    --disable-debuginfod
    --disable-libdebuginfod
