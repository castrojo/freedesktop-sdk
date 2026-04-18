kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/cairo.bst

variables:
  cmake-local: >-
    -DWITHOUT_OPENCV=ON
    -DWITHOUT_GAVL=ON

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v3.1.3-0-g32e91405d2ec5e222f75175b36dc4cc7bc0667ef
