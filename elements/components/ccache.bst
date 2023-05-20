kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/git-minimal.bst
- components/perl.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF
    -DCCACHE_DEV_MODE=OFF

depends:
- bootstrap-import.bst
- components/zstd.bst

sources:
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  ref: v4.8.1-0-g17d5c61227130894f0cedb5f5d0c7567f2b2c5a7
