kind: pip

build-depends:
- components/cython.bst
- components/python3-pip.bst

depends:
- components/libxml2.bst
- components/libxslt.bst
- components/python3.bst

sources:
- kind: pypi
  name: lxml
  ref:
    sha256sum: 520461c36727268a989790aef08884347cd41f2d8ae855489ccf40b50321d8d7
    suffix: aa/23/bda4e9881090f0f5e33e2efe89aacfa0668eb6e1ab2de28591e2912d78d4/lxml-4.9.0.tar.gz
