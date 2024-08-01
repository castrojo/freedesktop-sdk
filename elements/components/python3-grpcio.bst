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
    sha256sum: e2c9bbb84d5517f2bccdb1836b8ee267a1757acb3cb3e575065c103220b577ac
    suffix: 
      12/18/b5b5a871302d30667450f256557e1d4d07bdc273988c6932068dba60137d/grpcio-1.65.2.tar.gz
