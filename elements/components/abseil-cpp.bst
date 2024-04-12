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
  ref: 20240116.2-0-gd7aaad83b488fd62bd51c81ecf16cd938532cc0a
