kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: d59c97e7b774979a5ccb96388efc9eb65518004537e85d52e81eaee89ab6dd91
    suffix: 83/b0/18310b45f6eec3757c0554dbc1e03f2f7685c8a87831aea6adc1276faacc/setuptools-68.1.0.tar.gz
