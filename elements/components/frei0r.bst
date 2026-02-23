kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v2.5.2-0-gabebf31c85281b03cdbab957b1652dbaaabf43bc
