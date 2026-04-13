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
  ref: v3.1.2-0-g069cca5ff5bed24b881cbe75fd0c8189cf21e701
