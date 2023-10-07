kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/python3-wheel.bst
  type: build

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: a807eb2e4778d9156c8f07876c6e4d50b5494c5665c4834f67b06459dfd877b3
    suffix: 62/25/1b21a708e65a933e9e2ecf03bfc7fae7169981cc688155cdb581de3e86dc/Markdown-3.5.tar.gz
