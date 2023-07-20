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
    sha256sum: 0ff789ae7d8ddd76d2ac02e7d13bfef6fc4928ac01e1dcaa182be51b6bcc0aaa
    suffix: 2f/7e/ddf5d42c77418ebf6d57f1503084e2955e8cf1d49671372fbdff7a82cbe5/grpcio-1.56.2.tar.gz
