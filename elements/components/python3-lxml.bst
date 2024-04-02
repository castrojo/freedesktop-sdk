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
    sha256sum: 21dc490cdb33047bc7f7ad76384f3366fa8f5146b86cc04c4af45de901393b90
    suffix: 
      70/ec/b14f525777646d9cdccb573cbfeb5f72682089892c826c60f054e7ddd110/lxml-5.2.0.tar.gz
