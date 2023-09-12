kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 56ee14884fd8d0cd015411f4a13f40b4356775a0aefd9ebc1d3bfb9a1acb32f1
    suffix: e9/37/c6a6eb1ebeea919e4f394d811f234322d8a99eb58d5ee0f6089dbf06c488/setuptools-68.2.1.tar.gz
