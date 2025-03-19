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
  exclude:
  - '*.rc*'
  ref: 20250127.1-0-gd9e4955c65cd4367dd6bf46f4ccb8cd3d100540b
