kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: 404d48d62bba0b7a77ff9d405efd91501bef2e67ff4ace0bed40a0cf28c3c7cd
    suffix: a6/1d/7a01bc53a248ddb14eb0dca86f089ddf848d7b9485c31d7f840f27acbcfe/importlib_metadata-5.2.0.tar.gz
