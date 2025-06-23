kind: autotools-recc

(@):
- elements/include/rsync-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
