kind: make

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/dwz-source.yml

depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/base-sdk/xxhash.bst

build-depends:
- bootstrap/gnu-config.bst

variables:
  make-args: >-
    CFLAGS="${CFLAGS}"
    CXXFLAGS="${CXXFLAGS}"
    LDFLAGS="${LDFLAGS}"
