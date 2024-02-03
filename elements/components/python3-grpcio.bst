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
    sha256sum: dd1d3a8d1d2e50ad9b59e10aa7f07c7d1be2b367f3f2d33c5fade96ed5460962
    suffix: 
      7d/6d/919fd5886882c066122e69fbd938c1df2dc0aa22ab8de3e047c6aff5ac58/grpcio-1.60.1.tar.gz
