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
  ref: 20240722.1-0-gdd4c89bd657f1e247ce5111a5c89ffe6ccfd0c92
