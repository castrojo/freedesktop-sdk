kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/llvm.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DCMAKE_BUILD_TYPE=Release
    # ignore Warning
    -DCMAKE_CXX_FLAGS="-Wno-dangling-reference ${CMAKE_CXX_FLAGS}"

sources:
- kind: git_repo
  url: github:oneapi-src/level-zero.git
  track: 'v*.*'
  ref: v1.17.25-0-g3047d0fecf10deb2a123200e0f76ccb276603618
