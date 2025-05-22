kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/asciidoctor.bst
- components/doctest.bst
- components/git-minimal.bst
- components/perl.bst

depends:
- bootstrap-import.bst
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
  ref: v4.11.3-0-ga50f01935030e46fd6f35184ba7b1f11105967b7
