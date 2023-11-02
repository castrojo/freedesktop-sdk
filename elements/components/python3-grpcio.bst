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
    sha256sum: d8f9cd4ad1be90b0cf350a2f04a38a36e44a026cac1e036ac593dc48efe91d52
    suffix: 
      93/95/7c72028fe9fc46748fb769b13a1e0923acbb79095cd5124b8bac0cebd38c/grpcio-1.59.2.tar.gz
