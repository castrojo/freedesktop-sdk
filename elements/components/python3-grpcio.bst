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
    sha256sum: 563588c587b75c34b928bc428548e5b00ea38c46972181a4d8b75ba7e3f24231
    suffix: 
      71/d1/49a96df4eb1d805cf546247df40636515416d2d5c66665e5129c8b4162a8/grpcio-1.66.2.tar.gz
