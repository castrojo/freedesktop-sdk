kind: autotools

depends:
- bootstrap/base-sdk/base-sdk.bst

(@):
- elements/bootstrap/include/build.yml
- elements/include/rsync-source.yml

variables:
  conf-local: >-
    --without-included-zlib
    --disable-xxhash
    --disable-zstd
    --disable-simd
    --disable-md2man
    --disable-openssl
    --disable-lz4
