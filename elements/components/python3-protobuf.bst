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
    sha256sum: e8e09cb0d794c6687926fa558a8a6e72aa10edb997d5ca61da0765f12a3e00ea
    suffix: a7/e7/0553e21d25ca4d9f573135775348a372c3ec34a93a71d5f297c3bac38341/protobuf-7.36.0.tar.gz
