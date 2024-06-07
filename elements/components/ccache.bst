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
- kind: git_repo
  url: github:ccache/ccache.git
  track: v*
  ref: v4.9.1-0-gec510e9b0f333b8e97aee98108de3e0858340d59
