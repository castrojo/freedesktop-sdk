kind: cmake

build-depends:
- components/cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: |
    -DBUILD_TESTING:BOOL=OFF
  generator: Unix Makefiles

public:
  cpe:
    vendor: ninja_build

sources:
- kind: git_repo
  url: github:ninja-build/ninja.git
  track: v*
  ref: v1.13.2-0-g3441b633c2fe2c494e958780ba0f4227b1327634
