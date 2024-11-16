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
  ref: v1.34.3-0-gc29e75d54c3743783d51a609980495cf553b4bca
