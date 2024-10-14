kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

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
  ref: v1.34.1-0-g0c1c60dc60114812eb5950e6b50fa69d923a20e6
