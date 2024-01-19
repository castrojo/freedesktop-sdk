kind: autotools

build-depends:
- bootstrap/bootstrap.bst
- components/autoconf.bst

depends:
- bootstrap/bootstrap-base.bst

variables:
  conf-local: >-
    --enable-static
    --disable-shared

(@):
- elements/include/python3.yml
