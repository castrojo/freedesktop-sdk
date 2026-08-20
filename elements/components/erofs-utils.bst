kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xxhash.bst
- bootstrap/xz.bst
- components/fuse3.bst
- components/lz4.bst
- components/util-linux.bst

variables:
  conf-local: >-
    --enable-lzma
    --enable-lz4
    --enable-fuse
    --enable-multithreading

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/xiang/erofs-utils.git
  track: v*.*
  ref: v1.9.4-0-gf36cadb5c563995ab3aa8572a60ed6b721b9557d
