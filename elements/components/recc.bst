kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst
- components/libuuid-static.bst

depends:
- components/grpc.bst
- components/openssl.bst
- components/protobuf.bst
- components/tomlplusplus.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DOCI=OFF
    -DTOOLS=OFF
    -DRECC=ON

(@): elements/include/buildbox.yml
