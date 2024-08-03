kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython-3.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-protobuf.bst

environment:
  GRPC_PYTHON_BUILD_SYSTEM_OPENSSL: "true"
  GRPC_PYTHON_BUILD_SYSTEM_ZLIB: "true"
  GRPC_PYTHON_BUILD_WITH_CYTHON: "1"


sources:
- kind: pypi
  name: grpcio
  ref:
    sha256sum: 2a4f476209acffec056360d3e647ae0e14ae13dcf3dfb130c227ae1c594cbe39
    suffix: 
      cf/e7/739849982ca7fa1bf5e52a472803618e4f1f2963e9a73b1ca2cb056f95c7/grpcio-1.65.4.tar.gz
