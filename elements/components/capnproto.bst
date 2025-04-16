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
  ref: v1.1.0-0-gb34ec28cceaf15b1082b74b50f03f770873c3636
