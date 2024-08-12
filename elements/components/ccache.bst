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
  ref: v4.10.2-0-gcc653c59b715833f452cb9d696b35975fbc5952d
