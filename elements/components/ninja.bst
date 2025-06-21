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
  ref: v1.13.0-0-gb4d51f6ed5bed09dd2b70324df0d9cb4ecad2638
