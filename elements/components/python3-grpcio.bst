kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

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
    sha256sum: c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d
    suffix: 
      04/7a/cb869ec6d7f634c0153b4a38ae25bb33699b9307ea17f8cb22b609a46605/grpcio-1.62.2.tar.gz
