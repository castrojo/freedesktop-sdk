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
    sha256sum: db3f8fa10789c7a8e76d173c23364bdf0ebcd9449969a9e6a3dd31b8b7469f03
    suffix: 
      a6/67/f5c7df6457315877202f370450acb28626d033822eec1e8163600612b4ef/sphinxcontrib_qthelp-1.0.8.tar.gz
