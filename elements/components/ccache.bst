kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst
- components/asciidoc.bst
- components/asciidoctor.bst
- components/doctest.bst
- components/perl.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: v4.13.3-0-gcf9ed5cdfaf06d2d7f0d99c63c97e4aed8facbe3
