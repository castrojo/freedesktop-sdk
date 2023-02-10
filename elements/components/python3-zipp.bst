kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: 23f70e964bc11a34cef175bc90ba2914e1e4545ea1e3e2f67c079671883f9cb6
    suffix: d1/2f/ba544a8a6ad5ad9dcec1b00f536bb9fb078f5f50d1a1408876de18a9151b/zipp-3.13.0.tar.gz
