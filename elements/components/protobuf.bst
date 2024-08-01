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
  ref: v27.3-0-g7cc670c1809e704ebeba90fb430d50e009f36727
