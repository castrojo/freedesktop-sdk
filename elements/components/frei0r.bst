kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst
- components/mesa-headers.bst

variables:
  cmake-local: >-
    -DWITHOUT_OPENCV=ON
    -DWITHOUT_GAVL=ON

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v3.6.0-0-gd63e2e3537ec9119d1376c3d8f021bc2bfe35470
