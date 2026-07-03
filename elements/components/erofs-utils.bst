kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xxhash.bst
- components/util-linux.bst
- components/lz4.bst
# FIXME: No fuse3 support yet
# - components/fuse3.bst

variables:
  conf-local: >-
    --enable-lzma
    --enable-lz4
    --disable-fuse
    --enable-multithreading

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/xiang/erofs-utils.git
  track: v*.*
  ref: v1.9.2-0-g30711d4b2e234fe3e8aaeb779ade4cb609b0d920
