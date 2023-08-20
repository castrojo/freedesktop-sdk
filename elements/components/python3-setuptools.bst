kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 3d4dfa6d95f1b101d695a6160a7626e15583af71a5f52176efa5d39a054d475d
    suffix: 19/20/d8dd9d8becaf3e2d6fdc17cc41870d5ada5ceda518996cf5968c2ca71bd8/setuptools-68.1.2.tar.gz
