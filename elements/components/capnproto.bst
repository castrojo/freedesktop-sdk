kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zlib.bst
- components/openssl.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: github:capnproto/capnproto.git
  track: 'v*'
  ref: v1.2.0-0-gd135c9ca5e15219eaf131dfce1a41afdbaea9aab
