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
    sha256sum: b2cc8e8bb7c9326996f0e160137b0861f1a82162502658df2951209d0cb0309e
    suffix: 
      a5/73/4e6295c1420a9d20c9c351db3a36109b4c9aa601916cb7c6871e3196a1ca/protobuf-5.29.2.tar.gz
