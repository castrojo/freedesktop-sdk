kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/gflags.bst
- components/protobuf.bst
- components/util-linux.bst

variables:
  cmake-local: >-
    -DgRPC_SSL_PROVIDER=package
    -DgRPC_PROTOBUF_PROVIDER=package
    -DgRPC_ZLIB_PROVIDER=package
    -DgRPC_GFLAGS_PROVIDER=package
    -DgRPC_INSTALL_LIBDIR="%{lib}"

sources:
- kind: git_repo
  url: github:grpc/grpc.git
  track: v*
  exclude:
  - '*pre*'
  ref: v1.61.0-0-ga13178cb2537822bcdc552faba98fd9fa3c35b3e
- kind: git_module
  url: github:c-ares/c-ares.git
  path: third_party/cares/cares
  ref: 6360e96b5cf8e5980c887ce58ef727e53d77243a
- kind: git_module
  url: github:google/re2.git
  path: third_party/re2
  ref: 0c5616df9c0aaa44c9440d87422012423d91c7d1
- kind: git_module
  url: github:census-instrumentation/opencensus-proto.git
  path: third_party/opencensus-proto
  ref: 4aa53e15cbf1a47bc9087e6cfdca214c1eea4e89
