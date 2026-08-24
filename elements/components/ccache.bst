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
  ref: v4.14-0-ge256302fa60f897d6ac8a3df1bc5eddb7f4ccf02
