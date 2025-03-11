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
    sha256sum: 2b85f7820475ad3edec209d3d89a7909ada16caab05d3f2e08a7e8ae3200a55c
    suffix: 
      1c/95/aa11fc09a85d91fbc7dd405dcb2a1e0256989d67bf89fa65ae24b3ba105a/grpcio-1.71.0.tar.gz
