kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst


sources:
- kind: pypi
  name: pip
  ref:
    sha256sum: bb7d4f69f488432e4e96394612f43ab43dd478d073ef7422604a570f7157561e
    suffix: 
      0d/f6/07ef4561bb911285c229fa46ed3df1877bd6c5325c4c67d516560d59a6e6/pip-23.3.tar.gz
