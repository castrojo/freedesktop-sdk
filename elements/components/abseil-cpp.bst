kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git_repo
  url: github:abseil/abseil-cpp.git
  track: "*.*"
  ref: 20240116.1-0-g2f9e432cce407ce0ae50676696666f33a77d42ac
