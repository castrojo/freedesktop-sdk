# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/include/grpc-source.yml

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/abseil-cpp.bst
- components/c-ares.bst
- components/gflags.bst
- components/protobuf.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DgRPC_SSL_PROVIDER=package
    -DgRPC_PROTOBUF_PROVIDER=package
    -DgRPC_ZLIB_PROVIDER=package
    -DgRPC_GFLAGS_PROVIDER=package
    -DgRPC_CARES_PROVIDER=package
    -DgRPC_ABSL_PROVIDER=package
    -DgRPC_INSTALL_LIBDIR="%{lib}"
