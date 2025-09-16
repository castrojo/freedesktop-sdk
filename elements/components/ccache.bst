kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/doctest.bst
- components/git-minimal.bst
- components/fmtlib.bst
- components/perl.bst

depends:
- bootstrap-import.bst
- components/zstd.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF
    -DCCACHE_DEV_MODE=OFF
    -DFMT_LIBRARY="%{libdir}/libfmt.a"
    -DENABLE_TESTING=OFF

sources:
- kind: git_repo
  url: github:ccache/ccache.git
  track: v*
  ref: v4.12-0-g72ec02a55e48fefdb154a57242043dd21efbe4df
