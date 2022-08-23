kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: async-timeout
  ref:
    sha256sum: 2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15
    suffix: 54/6e/9678f7b2993537452710ffb1750c62d2c26df438aa621ad5fa9d1507a43a/async-timeout-4.0.2.tar.gz
