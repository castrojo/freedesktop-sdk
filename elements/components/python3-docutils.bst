kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- filename: components/python3.bst

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: f75a5a52fbcacd81b47e42888ad2b380748aaccfb3f13af0fe69deb759f01eb6
    suffix: e6/a9/8ddfaa7a9414e42520e0041d1354ebda699e4eb1b47e2f1b6d8bda66aba6/docutils-0.20.tar.gz
