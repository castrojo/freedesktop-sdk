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
    sha256sum: fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f
    suffix: 70/bb/7a2c7b4f8f434aa1ee801704bf08f1e53d7b5feba3d5313ab17003477808/lxml-4.9.1.tar.gz
