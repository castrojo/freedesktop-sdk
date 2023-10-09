kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/abseil-cpp.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=YES

sources:
- kind: git_repo
  url: github:google/re2.git
  track: '*-*-*'
  ref: 2023-09-01-0-g930e6b21f89d2d8a1bfb69f81557abdf5eb213cc
