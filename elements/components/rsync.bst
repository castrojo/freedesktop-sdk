kind: autotools

(@):
- elements/include/rsync-source.yml
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xxhash.bst
- bootstrap/zlib-ng.bst
- components/lz4.bst
- components/openssl.bst
- components/popt.bst

variables:
  conf-local: >-
    --without-included-zlib
    --disable-zstd
    --disable-simd
    --disable-md2man
