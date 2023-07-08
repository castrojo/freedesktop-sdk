kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: charset-normalizer
  ref:
    sha256sum: 3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace
    suffix: 2a/53/cf0a48de1bdcf6ff6e1c9a023f5f523dfe303e4024f216feac64b6eb7f67/charset-normalizer-3.2.0.tar.gz
