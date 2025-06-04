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
    sha256sum: 87f62c94a40947cec1a0f91f95f5ba0aa8f799f23a1d42ae5be667b6b27b959c
    suffix: 
      fe/45/ff8c80a5a2e7e520d9c4d3c41484a11d33508253f6f4dd06d2c4b4158999/grpcio-1.72.1.tar.gz
