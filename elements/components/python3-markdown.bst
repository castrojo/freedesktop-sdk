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
    sha256sum: ed4f41f6daecbeeb96e576ce414c41d2d876daa9a16cb35fa8ed8c2ddfad0224
    suffix: 
      22/02/4785861427848cc11e452cc62bb541006a1087cf04a1de83aedd5530b948/Markdown-3.6.tar.gz
