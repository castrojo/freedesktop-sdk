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
  ref: v4.7.2-0-g98a04d7c881859910080619ba926eb74988c8c74
