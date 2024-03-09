kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

runtime-depends:
- components/protobuf.bst

environment:
  GRPC_PYTHON_BUILD_SYSTEM_OPENSSL: "true"
  GRPC_PYTHON_BUILD_SYSTEM_ZLIB: "true"
  GRPC_PYTHON_BUILD_WITH_CYTHON: "1"


sources:
- kind: pypi
  name: grpcio
  ref:
    sha256sum: 6c455e008fa86d9e9a9d85bb76da4277c0d7d9668a3bfa70dbe86e9f3c759947
    suffix: 
      c7/bb/d01494037edee2d8e024cac8049b169b2723186b01cebb495ccf677bbba9/grpcio-1.62.1.tar.gz
