kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/cython.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: 3666906492efb76453c0e7b97f2cf459b0682e7402c0489a95484965dbc1da49
    suffix: 4a/15/bd620f7a6eb9aa5112c4ef93e7031bcd071e0611763d8e17706ef8ba65e0/multidict-6.0.4.tar.gz
