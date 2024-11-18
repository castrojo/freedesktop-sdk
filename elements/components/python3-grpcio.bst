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
    sha256sum: 7e7483d39b4a4fddb9906671e9ea21aaad4f031cdfc349fec76bdfa1e404543a
    suffix: 
      d5/da/132615afbfc722df4bba963844843a205aa298fd5f9a03fa2995e8dddf11/grpcio-1.68.0.tar.gz
