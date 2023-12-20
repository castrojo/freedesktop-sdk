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
    sha256sum: 7fd9972f96db22c8077a1ee2691b172c8089b17a5652a44494a9ecb0d78f9149
    suffix: 
      b7/06/6b1ad0ae8f97d7a0d6f6ad640db10780578999e647a9593512ceb6f06469/pip-23.3.2.tar.gz
