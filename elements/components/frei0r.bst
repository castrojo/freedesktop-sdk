kind: cmake

depends:
- public-stacks/runtime-minimal.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/cairo.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v2.3.3-0-gcdeddc7553bbfdc446c61d1bfa6a51bcc029b4a8
