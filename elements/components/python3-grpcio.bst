kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/c-ares.bst
- components/python3.bst

runtime-depends:
- components/python3-six.bst
- components/protobuf.bst

environment:
  GRPC_PYTHON_BUILD_SYSTEM_OPENSSL: "true"
  GRPC_PYTHON_BUILD_SYSTEM_ZLIB: "true"
  GRPC_PYTHON_BUILD_SYSTEM_CARES: "true"
  GRPC_PYTHON_BUILD_WITH_CYTHON: "1"


sources:
- kind: pypi
  name: grpcio
  ref:
    sha256sum: 4b089f7ad1eb00a104078bab8015b0ed0ebcb3b589e527ab009c53893fd4e613
    suffix: 18/b5/3ebe1bd133f472640e2d8941d2208b8de63706ebc08b09e1bb988d7f0071/grpcio-1.57.0.tar.gz
