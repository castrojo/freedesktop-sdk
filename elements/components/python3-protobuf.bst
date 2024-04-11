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
    sha256sum: 8ca2a1d97c290ec7b16e4e5dff2e5ae150cc1582f55b5ab300d45cb0dfa90e51
    suffix: d2/e5/7e22ca7201a6b1040aae7787d0fe6cd970311da376a86fdafa5182be1d1b/protobuf-5.26.1.tar.gz
