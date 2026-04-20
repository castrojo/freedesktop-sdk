kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/asciidoctor.bst
- components/doctest.bst
- components/git-minimal.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zstd.bst
- components/fmtlib.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF
    -DCCACHE_DEV_MODE=OFF
    -DENABLE_TESTING=OFF

sources:
- kind: git_repo
  url: github:ccache/ccache.git
  track: v*
  ref: v4.13.4-0-g472d093622729b853cf4ea5ad3d0743ff6532956
