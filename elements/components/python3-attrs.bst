kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: attrs
  ref:
    sha256sum: 935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30
    suffix: 
      e3/fc/f800d51204003fa8ae392c4e8278f256206e7a919b708eef054f5f4b650d/attrs-23.2.0.tar.gz
