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
    sha256sum: 44a8502dd5de653ae6a73e2de50a401d84184f0331d0ac3daeb044e66d5c5054
    suffix: 
      91/ec/b76ff6d86bdfd1737a5ec889394b54c18b1ec3832d91041e25023fbcb67d/grpcio-1.68.1.tar.gz
