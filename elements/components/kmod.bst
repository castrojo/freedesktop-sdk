kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst
- components/xz.bst
- components/zlib.bst
- components/zstd.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/scdoc.bst

variables:
  conf-local: >-
    --with-xz
    --with-zlib
    --with-zstd
    --with-openssl
    --enable-tools

sources:
- kind: git_repo
  url: kernel:utils/kernel/kmod/kmod.git
  track: v*
  ref: v34-0-g889403790977880b8759020338e7cf9634b6ce68
