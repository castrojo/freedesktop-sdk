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
    sha256sum: e104be388c28462b4e83bd0ddfc68eff6022305cc4b5ab14caf8d235fae132b9
    suffix: 66/bf/a7c9e8cc23c105633b74e3280c2b06d13273da0df389e59395188d440017/Markdown-3.4.2.tar.gz
