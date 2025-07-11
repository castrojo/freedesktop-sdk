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
  ref: v1.13.1-0-g79feac0f3e3bc9da9effc586cd5fea41e7550051
