kind: pyproject


build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/c-ares.bst
- components/python3.bst

runtime-depends:
- components/python3-six.bst
- components/protobuf.bst

environment:
  GRPC_PYTHON_BUILD_SYSTEM_OPENSSL: "true"
  GRPC_PYTHON_BUILD_SYSTEM_ZLIB: "true"
  GRPC_PYTHON_BUILD_SYSTEM_CARES: "true"
  GRPC_PYTHON_BUILD_WITH_CYTHON: "1"


sources:
- kind: pypi
  name: grpcio
  ref:
    sha256sum: 4c08ee21b3d10315b8dc26f6c13917b20ed574cdbed2d2d80c53d5508fdcc0f2
    suffix: ee/d6/62ea04e71abe92406baf8fbe25daee5e90d45571206b8e93c4812ea958b6/grpcio-1.56.0.tar.gz
