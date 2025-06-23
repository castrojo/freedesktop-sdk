kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- (@): include/_private/gcc-for-recc.yml

variables:
  cmake-local: >-
    -DUTF8_TESTS=OFF

sources:
- kind: git_repo
  url: github:nemtrif/utfcpp.git
  track: v*
  ref: v4.0.9-0-g63d64de49fd6b829f7c8694df5ab2ee625cb7134
