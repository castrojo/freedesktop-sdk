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
    sha256sum: 626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd
    suffix: d7/77/ebb15fc26d0f815839ecd897b919ed6d85c050feeb83e100e020df9153d2/attrs-21.4.0.tar.gz
