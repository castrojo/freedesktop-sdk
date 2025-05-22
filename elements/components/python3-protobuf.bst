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
    sha256sum: 314fab1a6a316469dc2dd46f993cbbe95c861ea6807da910becfe7475bc26ffe
    suffix: 
      13/48/718c1e104a2e89970a8ff3b06d87e152834b576c570a6908f8c17ba88d65/protobuf-6.31.0.tar.gz
