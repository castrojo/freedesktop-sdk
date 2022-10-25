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
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  ref: v4.7.1-0-gd392de239bcad9a3d056cb92469163e3c64ae2f0
