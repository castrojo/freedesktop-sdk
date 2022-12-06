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
    sha256sum: 2523a29006c034687eccd3ee70093a697129a3ffe8732535d3b2df6a4ecc279d
    suffix: b5/5b/1dd3b9cf73c474ea1d0f0b1f8b7b712b0f13817493fd93101256ec856b59/multidict-6.0.3.tar.gz
