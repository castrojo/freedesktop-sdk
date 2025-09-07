kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v2.4.0-0-ge7dd4f600b9e1ae15e9e7be1b5f4464d0b1bfda8
