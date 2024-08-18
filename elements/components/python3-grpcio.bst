kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

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
    sha256sum: ec6f219fb5d677a522b0deaf43cea6697b16f338cb68d009e30930c4aa0d2209
    suffix: 
      6c/d8/1d8f1640649808db79b689d65b03556077d5504baad5ea64b167a5adedad/grpcio-1.65.5.tar.gz
