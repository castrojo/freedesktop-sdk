kind: pip

build-depends:
- bootstrap-import.bst
- components/python3-pip.bst
- components/python3-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pygments
  ref:
    sha256sum: da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367
    suffix: 
      55/59/8bccf4157baf25e4aa5a0bb7fa3ba8600907de105ebc22b0c78cfbf6f565/pygments-2.17.2.tar.gz
