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
    sha256sum: 2199165a1affb666aa24adf0c97436686d0a61bc5fc113c037701fb7c7fceb96
    suffix: 
      61/38/c615b5c2be690fb31871f294cc08a96e598b085b8d07c5967a5018e0b90c/grpcio-1.60.0.tar.gz
