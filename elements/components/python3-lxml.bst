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
    sha256sum: 2219cbf790e701acf9a21a31ead75f983e73daf0eceb9da6990212e4d20ebefe
    suffix: 
      80/2c/076fafd979728858829fb9ce2e13fa6367b6be9acc4da0cff6367aa6a1ce/lxml-5.0.0.zip
