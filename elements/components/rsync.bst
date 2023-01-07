kind: autotools

depends:
- bootstrap-import.bst
- components/lz4.bst
- components/openssl.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

variables:
  builddir: ''
  conf-local: >-
    --without-included-zlib
    --disable-xxhash
    --disable-zstd
    --disable-simd
    --disable-md2man

(@):
- elements/include/rsync-source.yml
