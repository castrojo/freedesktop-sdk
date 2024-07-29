kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-qthelp
  ref:
    sha256sum: 4fe7d0ac8fc171045be623aba3e2a8f613f8682731f9153bb2e40ece16b9bbab
    suffix: 
      68/bc/9104308fc285eb3e0b31b67688235db556cd5b0ef31d96f30e45f2e51cae/sphinxcontrib_qthelp-2.0.0.tar.gz
