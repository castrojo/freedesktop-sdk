kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DDOCTEST_WITH_TESTS=OFF

sources:
- kind: git_repo
  url: github:doctest/doctest.git
  track: v*
  ref: v2.5.1-0-g415855d33e88146425c2d8db1825797e7b1a4c85
