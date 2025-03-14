kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
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
  - '*head*'
  - '*rc*'
  - '*dev*'
  ref: v30.1-0-g0d815c5b74281f081c1ee4b431a4d5bbb1615c97
