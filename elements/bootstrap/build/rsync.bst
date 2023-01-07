kind: autotools

depends:
- bootstrap/build/base-sdk.bst

(@):
- elements/bootstrap/include/build.yml
- elements/include/rsync-source.yml

variables:
  builddir: ''
  conf-local: >-
    --without-included-zlib
    --disable-xxhash
    --disable-zstd
    --disable-simd
    --disable-md2man
    --disable-openssl
    --disable-lz4
    --disable-md5-asm

config:
  install-commands:
    (>):
    # We remove documentation since this is temporary element
    - |
      rm -rf "%{install-root}%{mandir}"
