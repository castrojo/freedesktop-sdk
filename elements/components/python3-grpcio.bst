kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

runtime-depends:
- components/protobuf.bst

environment:
  GRPC_PYTHON_BUILD_SYSTEM_OPENSSL: "true"
  GRPC_PYTHON_BUILD_SYSTEM_ZLIB: "true"
  GRPC_PYTHON_BUILD_WITH_CYTHON: "1"


sources:
- kind: pypi
  name: grpcio
  ref:
    sha256sum: 748496af9238ac78dcd98cce65421f1adce28c3979393e3609683fcd7f3880d7
    suffix: 
      50/4e/7ed8c24c93c8d000b9ea2927f555ae3b03cfabe035d65eda0db848cb20b6/grpcio-1.62.0.tar.gz
