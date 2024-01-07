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
    sha256sum: 4432a1d89a9b340bc6bd1201aef3ba03112f151d3f340d9218247dc0c85028ab
    suffix: 
      83/18/1d0c7cf3df839cc2827a0deee2e4b42f4048bc4c1c15612271e2db3928e5/lxml-5.0.1.tar.gz
