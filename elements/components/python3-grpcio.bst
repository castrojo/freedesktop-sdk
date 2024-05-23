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
    sha256sum: 257baf07f53a571c215eebe9679c3058a313fd1d1f7c4eede5a8660108c52d9c
    suffix: 
      49/53/12b7979d18da23709ae93aabc5cdba1b0fb789222af48530a8cb63755a4d/grpcio-1.64.0.tar.gz
