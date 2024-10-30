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
    sha256sum: 3dc2ed4cabea4dc14d5e708c2b426205956077cc5de419b4d4079315017e9732
    suffix: 
      20/53/d9282a66a5db45981499190b77790570617a604a38f3d103d0400974aeb5/grpcio-1.67.1.tar.gz
