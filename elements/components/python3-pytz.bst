kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pytz
  ref:
    sha256sum: a27dcf612c05d2ebde626f7d506555f10dfc815b3eddccfaadfc7d99b11c9a07
    suffix: 55/71/cb1b0a0035cf479eaf05109ea830323af66d48197bfc759a018f94acc3c4/pytz-2023.2.tar.gz
