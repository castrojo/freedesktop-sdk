kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DCARES_SYMBOL_HIDING=ON
    -DCARES_BUILD_TOOLS=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcares.so'

sources:
- kind: git_repo
  url: github:c-ares/c-ares.git
  track: v*
  ref: v1.34.9-0-gbc91829cce983a35ec01f5dbc05465858a3df469
