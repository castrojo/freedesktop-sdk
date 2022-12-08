kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-pyyaml.bst

sources:
- kind: local
  path: files/oci
