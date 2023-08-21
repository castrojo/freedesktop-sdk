kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: poetry-core
  ref:
    sha256sum: 8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74
    suffix: cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b/poetry_core-1.7.0.tar.gz
