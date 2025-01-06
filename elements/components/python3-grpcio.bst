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
    sha256sum: 936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5
    suffix: 
      e4/87/06a145284cbe86c91ca517fe6b57be5efbb733c0d6374b407f0992054d18/grpcio-1.69.0.tar.gz
