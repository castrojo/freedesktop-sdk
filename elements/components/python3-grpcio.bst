kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/c-ares.bst
- components/python3.bst

runtime-depends:
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
    sha256sum: 532410c51ccd851b706d1fbc00a87be0f5312bd6f8e5dbf89d4e99c7f79d7499
    suffix: 
      5d/a2/781bae6df87dfd31115b24b1fe01213ef29caf9dbd0b8c1688c59aebf617/grpcio-1.58.0.tar.gz
