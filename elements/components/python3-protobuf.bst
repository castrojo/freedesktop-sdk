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
    sha256sum: dde74af0fa774fa98892209992295adbfb91da3fa98c8f67a88afe8f5a349add
    suffix: 
      5f/d7/331ee1f3b798c34d2257c79d5426ecbe95d46d2b40ba808a29da6947f6d8/protobuf-5.28.0.tar.gz
