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
  ref: v4.8-0-gfe03859ebe1e5fdf87b02fba3d70f5854124d453
