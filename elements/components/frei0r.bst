kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst

variables:
  cmake-local: >-
    -DWITHOUT_OPENCV=ON
    -DWITHOUT_GAVL=ON

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v2.5.6-0-g530f7e6388c6931f20aa2ca9e4ea33a60df7aca7
