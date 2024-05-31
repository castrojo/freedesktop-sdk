kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/fmtlib.bst
- components/git-minimal.bst
- components/perl.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF
    -DCCACHE_DEV_MODE=OFF
    -DENABLE_TESTING=OFF

depends:
- bootstrap-import.bst
- components/zstd.bst

sources:
- kind: git_repo
  url: github:ccache/ccache.git
  track: v*
  ref: v4.10-0-g7e31d0591eee51723266b24b29c111a089cc7958
