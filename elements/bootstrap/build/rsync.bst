kind: autotools

(@):
- elements/bootstrap/include/build.yml
- elements/include/rsync-source.yml

build-depends:
- bootstrap/base-sdk/automake.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

variables:
  conf-local: >-
    --without-included-zlib
    --disable-xxhash
    --disable-zstd
    --disable-simd
    --disable-md2man
    --disable-openssl
    --disable-lz4
