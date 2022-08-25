kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: clikit
  ref:
    sha256sum: 442ee5db9a14120635c5990bcdbfe7c03ada5898291f0c802f77be71569ded59
    suffix: 0b/07/27d700f8447c0ca81454a4acdb7eb200229a6d06fe0b1439acc3da49a53f/clikit-0.6.2.tar.gz
