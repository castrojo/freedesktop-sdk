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
    sha256sum: 7fce2cd1c0c1116cf3850564ebfc3264fba75d3c74a7414373f1238ea365ef87
    suffix: 
      79/e8/b43b851537da2e2f03fa8be1aef207e5cbfb1a2e014fbb6b40d24c177cd3/grpcio-1.73.1.tar.gz
