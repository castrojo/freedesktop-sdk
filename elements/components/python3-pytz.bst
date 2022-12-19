kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pytz
  ref:
    sha256sum: 7ccfae7b4b2c067464a6733c6261673fdb8fd1be905460396b97a073e9fa683a
    suffix: 6d/37/54f2d7c147e42dc85ffbc6910862bb4f141fb3fc14d9a88efaa1a76c7df2/pytz-2022.7.tar.gz
