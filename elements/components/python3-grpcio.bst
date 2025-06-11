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
    sha256sum: 3af4c30918a7f0d39de500d11255f8d9da4f30e94a2033e70fe2a720e184bd8e
    suffix: 
      8e/7b/ca3f561aeecf0c846d15e1b38921a60dffffd5d4113931198fbf455334ee/grpcio-1.73.0.tar.gz
