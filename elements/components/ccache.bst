kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/git-minimal.bst
- components/perl.bst

depends:
- bootstrap-import.bst
- components/zstd.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF
    -DCCACHE_DEV_MODE=OFF

sources:
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  ref: v4.7.4-0-g1527040bc2a278b9d3d51badb732ecf5841d8bb5
