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
  ref: v1.33.1-0-g27b98d96eff6122fb981e338bddef3d6a57d8d44
