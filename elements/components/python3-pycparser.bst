kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pycparser
  ref:
    sha256sum: e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206
    suffix: 5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de/pycparser-2.21.tar.gz
