kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/abseil-cpp.bst

variables:
  cmake-local: >-
    -Dprotobuf_BUILD_TESTS:BOOL=OFF
    -Dprotobuf_ABSL_PROVIDER=package
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -Dprotobuf_BUILD_SHARED_LIBS=ON

sources:
- kind: git_repo
  url: github:protocolbuffers/protobuf.git
  track: v*
  exclude:
  - '*rc*'
  - '*dev*'
  - '*head*'
  ref: v31.1-0-g74211c0dfc2777318ab53c2cd2c317a2ef9012de
