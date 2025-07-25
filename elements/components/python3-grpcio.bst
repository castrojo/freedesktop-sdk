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
    sha256sum: 80d1f4fbb35b0742d3e3d3bb654b7381cd5f015f8497279a1e9c21ba623e01b1
    suffix: 
      38/b4/35feb8f7cab7239c5b94bd2db71abb3d6adb5f335ad8f131abb6060840b6/grpcio-1.74.0.tar.gz
