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
    sha256sum: 7800f99568a74a06ebdccd419dd1b6e639b477dcaf6da77ea702f8fb14ce5f80
    suffix: 
      ab/a1/f838646e25402eb750f037cf84c1ada46084717375e44724c89900ee4c7d/grpcio-1.59.3.tar.gz
