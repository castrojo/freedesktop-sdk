kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux.bst
- components/lz4.bst
# FIXME: No fuse3 support yet
# - components/fuse3.bst

variables:
  conf-local: >-
    --enable-lzma
    --enable-lz4
    --disable-fuse

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/xiang/erofs-utils.git
  track: v*.*
  ref: v1.8.9-0-g81169bf3cfd26b8f2b3aa3b20da23971168a90a9
