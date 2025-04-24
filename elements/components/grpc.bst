kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/gflags.bst
- components/protobuf.bst

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
  ref: v1.72.0-0-g6c472088f7ced709efac16bf41d399c7ad6f1a44
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
- kind: git_module
  url: github:cncf/xds.git
  path: third_party/xds
  ref: 3a472e524827f72d1ad621c4983dd5af54c46776
- kind: git_module
  url: github:envoyproxy/data-plane-api.git
  path: third_party/envoy-api
  ref: 4de3c74cf21a9958c1cf26d8993c55c6e0d28b49
- kind: git_module
  url: github:googleapis/googleapis.git
  path: third_party/googleapis
  ref: fe8ba054ad4f7eca946c2d14a63c3f07c0b586a0
- kind: git_module
  path: third_party/protoc-gen-validate
  url: github:envoyproxy/protoc-gen-validate.git
  ref: 32c2415389a3538082507ae537e7edd9578c64ed
