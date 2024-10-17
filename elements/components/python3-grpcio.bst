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
    sha256sum: e090b2553e0da1c875449c8e75073dd4415dd71c9bde6a406240fdf4c0ee467c
    suffix: 
      ec/ae/3c47d71ab4abd4bd60a7e2806071fe0a4b6937b9eabe522291787087ea1f/grpcio-1.67.0.tar.gz
