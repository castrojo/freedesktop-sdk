kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst
- components/_private/libuuid-static.bst

depends:
- components/grpc.bst
- components/openssl.bst
- components/protobuf.bst
- components/tomlplusplus.bst

runtime-depends:
- components/_private/recc-wrappers.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DOCI=OFF
    -DTOOLS=OFF
    -DRECC=ON

(@): elements/include/buildbox.yml
