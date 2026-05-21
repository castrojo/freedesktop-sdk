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

  # I believe protobuf >= v35 requires a v2025* release of abseil which is not
  # allowed on the 24.08 release branch due to ABI changes.
  track: v34*

  exclude:
  - '*head*'
  - '*rc*'
  - '*dev*'
  ref: v34.2-0-gb2f8f21c9a7b2bcd0cb26d92c459b7f2c30cd635
