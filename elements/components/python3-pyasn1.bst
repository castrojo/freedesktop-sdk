kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyasn1
  ref:
    sha256sum: 9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b
    suffix: fe/b6/6e630dff89739fcd427e3f72b3d905ce0acb85a45d4ec3e2678718a3487f/pyasn1-0.6.2.tar.gz
