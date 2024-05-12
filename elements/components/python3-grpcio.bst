kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
# https://github.com/grpc/grpc/issues/33918
- components/cython-0.29.bst

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
    sha256sum: f3023e14805c61bc439fb40ca545ac3d5740ce66120a678a3c6c2c55b70343d1
    suffix: 
      0c/2a/23943e19b4bbbdad60a9d881e44cd53bb48b31c7419ebb7b983edfbbb708/grpcio-1.63.0.tar.gz
