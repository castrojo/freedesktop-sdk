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
  ref: 20250127.0-0-g9ac7062b1860d895fb5a8cbf58c3e9ef8f674b5f
