kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/abseil-cpp.bst
- components/c-ares.bst
- components/python3.bst
- components/re2.bst

runtime-depends:
- components/protobuf.bst

environment:
  GRPC_PYTHON_BUILD_SYSTEM_OPENSSL: "true"
  GRPC_PYTHON_BUILD_SYSTEM_ZLIB: "true"
  GRPC_PYTHON_BUILD_SYSTEM_CARES: "true"
  GRPC_PYTHON_BUILD_WITH_CYTHON: "true"
  GRPC_PYTHON_BUILD_SYSTEM_RE2: 'true'
  GRPC_PYTHON_BUILD_SYSTEM_ABSL: 'true'
  GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY: 'true'
  GRPC_PYTHON_CFLAGS: "-std=c++17 -fvisibility=hidden -fno-wrapv -fno-exceptions"


sources:
- kind: pypi
  name: grpcio
  ref:
    sha256sum: acf70a63cf09dd494000007b798aff88a436e1c03b394995ce450be437b8e54f
    suffix: 
      38/98/ca2cb5a81e0e2f3e3a00ebf91338fd3278ea0673e156a7ff2de30fe17113/grpcio-1.59.0.tar.gz
