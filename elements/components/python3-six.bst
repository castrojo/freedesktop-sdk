kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: six
  ref:
    sha256sum: 1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926
    suffix: 71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz
