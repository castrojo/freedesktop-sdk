kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-pyyaml.bst
- components/fakecap.bst

sources:
- kind: local
  path: files/oci
