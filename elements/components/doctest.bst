kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DDOCTEST_WITH_TESTS=OFF

sources:
- kind: git_repo
  url: github:doctest/doctest.git
  track: v*
  ref: v2.5.0-0-gd44d4f6e66232d716af82f00a063759e9d0e50d6
