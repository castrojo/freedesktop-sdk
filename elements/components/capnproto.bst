kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib.bst
- components/openssl.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: github:capnproto/capnproto.git
  track: 'v*'
  ref: v1.5.0-0-g373e61ec89e2359f1c362e9b2eadc552f4779306
