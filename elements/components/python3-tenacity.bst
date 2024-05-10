kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: tenacity
  ref:
    sha256sum: 953d4e6ad24357bceffbc9707bc74349aca9d245f68eb65419cf0c249a1949a2
    suffix: 
      32/6c/57df6196ce52c464cf8556e8f697fec5d3469bb8cd319c1685c0a090e0b4/tenacity-8.3.0.tar.gz
