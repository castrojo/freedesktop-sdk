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
    sha256sum: 35334f9c9745add3e357e3372756fd32d925bd52c41da97f4dfdafbde0bf0ee2
    suffix: 
      e7/42/94293200e40480d79fc876b2330e7dffb20f959b390afa77c0dbaa0c8372/grpcio-1.66.1.tar.gz
