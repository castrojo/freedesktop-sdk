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
    sha256sum: c1ea4c528e7db6660718e4165fd1b5ac24b79a70c870a7bc0b7bdb9babab7c1e
    suffix: 
      7d/0a/b79043717cc40861145f12d2045a0064f43eeb4efa359d84e75e0ff2d3ba/grpcio-1.66.0.tar.gz
