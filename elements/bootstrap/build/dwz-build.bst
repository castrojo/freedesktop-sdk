kind: make

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/dwz-source.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

variables:
  make-args: >-
    CFLAGS="${CFLAGS}"
    CXXFLAGS="${CXXFLAGS}"
    LDFLAGS="${LDFLAGS}"
