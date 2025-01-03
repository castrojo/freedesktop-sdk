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
  ref: v1.8.4-0-gb4b93c26c7e8e771af93627f02791818e7c78f6c
