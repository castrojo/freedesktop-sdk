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
    sha256sum: 3c492301988cd720cd145d84e17318d45af342e29ef93141228f9cd73222368b
    suffix: 
      d9/59/bdfe3fc167366e064392367083e705f2b63aeda2b7c004055e7ec80ef538/grpcio-1.65.1.tar.gz
