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
    sha256sum: 5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8
    suffix: 
      4d/87/fb90046e096a03aeab235e139436b3fe804cdd447ed2093b0d70eba3f7f8/pip-24.2.tar.gz
