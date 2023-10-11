kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
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
  ref: v1.7-0-gce36273833096f1b7e828309d9b1caa37132092d
