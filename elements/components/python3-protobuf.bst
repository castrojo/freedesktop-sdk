kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
# requires pypi tarball specifically
- kind: pypi
  name: protobuf
  exclude:
  - '*rc*'
  ref:
    sha256sum: 35c859ae076d8c56054c25b59e5e59638d86545ed6e2b6efac6be0b6ea3ba048
    suffix: 
      c8/8c/cf2ac658216eebe49eaedf1e06bc06cbf6a143469236294a1171a51357c3/protobuf-6.30.2.tar.gz
