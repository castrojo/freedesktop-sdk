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
    sha256sum: a4952899b4931a6ba12951f9a141ef3e74ff8a6ec9aa2dc602afa40f63595e33
    suffix: 9d/13/f7e3834ba272c0058c66de57272fb3b20dde69003032fdb6b4d7c36eebed/grpcio-1.53.0.tar.gz
