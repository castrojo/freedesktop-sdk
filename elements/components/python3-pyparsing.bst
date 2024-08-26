kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyparsing
  ref:
    sha256sum: f86ec8d1a83f11977c9a6ea7598e8c27fc5cddfa5b07ea2241edbbde1d7bc032
    suffix: 
      83/08/13f3bce01b2061f2bbd582c9df82723de943784cf719a35ac886c652043a/pyparsing-3.1.4.tar.gz
