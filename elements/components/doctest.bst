kind: cmake

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DDOCTEST_WITH_TESTS=OFF

sources:
- kind: git_repo
  url: github:doctest/doctest.git
  track: v*
  ref: v2.4.11-0-gae7a13539fb71f270b87eb2e874fbac80bc8dda2
