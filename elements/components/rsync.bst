kind: autotools

(@):
- elements/include/rsync-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xxhash.bst
- bootstrap/zlib.bst
- components/lz4.bst
- components/openssl.bst
- components/popt.bst

variables:
  conf-local: >-
    --without-included-zlib
    --disable-zstd
    --disable-simd
    --disable-md2man
