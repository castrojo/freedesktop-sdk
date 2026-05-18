kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DUTF8_TESTS=OFF

sources:
- kind: git_repo
  url: github:nemtrif/utfcpp.git
  track: v*
  ref: v4.1.0-0-g660314d3d0c9e1be54b53704e719cecf2b43f505
