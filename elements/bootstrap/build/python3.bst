kind: autotools

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/base-sdk.bst

(@):
- elements/bootstrap/include/build.yml
- elements/include/python3.yml

variables:
  conf-local: >-
    --enable-static
    --disable-shared
