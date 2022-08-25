kind: pip

depends:
- filename: components/python3.bst

build-depends:
- filename: bootstrap-import.bst
- filename: components/python3-pip.bst

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: 686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125
    suffix: 4c/17/559b4d020f4b46e0287a2eddf2d8ebf76318fd3bd495f1625414b052fdc9/docutils-0.17.1.tar.gz
