kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: f104fa03692a2602fa0fec6c6a9e63b6c8a968de13e17c026957dd1f53d80990
    suffix: fd/53/e5d7ae40d03e4ed20b7cba317cf9c0c97097c8debb39f9d72d182a6578a2/setuptools-67.7.2.tar.gz
