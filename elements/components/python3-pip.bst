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
    sha256sum: 8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b
    suffix: 
      47/3e/68beeeeb306ea20ffd30b3ed993f531d16cd884ec4f60c9b1e238f69f2af/pip-25.0.tar.gz
