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
  ref: v2.5.4-0-gfc9320063a0ae3f0e14b0ba408d71ca03db5b54f
