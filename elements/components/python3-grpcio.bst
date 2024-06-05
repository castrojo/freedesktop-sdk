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
    sha256sum: 8d51dd1c59d5fa0f34266b80a3805ec29a1f26425c2a54736133f6d87fc4968a
    suffix: 
      f5/9d/662a0c2181b2d7c1ec697ff06ec5ab9c37ed14e7f9e720e16f26443d233a/grpcio-1.64.1.tar.gz
