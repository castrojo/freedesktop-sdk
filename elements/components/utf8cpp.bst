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
  ref: v4.0.5-0-g6be08bbea14ffa0a5c594257fb6285a054395cd7
