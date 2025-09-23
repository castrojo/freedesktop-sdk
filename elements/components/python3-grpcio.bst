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
    sha256sum: b989e8b09489478c2d19fecc744a298930f40d8b27c3638afbfe84d22f36ce4e
    suffix: 
      91/88/fe2844eefd3d2188bc0d7a2768c6375b46dfd96469ea52d8aeee8587d7e0/grpcio-1.75.0.tar.gz
