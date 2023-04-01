kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 257de92a9d50a60b8e22abfcbb771571fde0dbf3ec234463212027a4eeecbe9a
    suffix: cb/46/22ec35f286a77e6b94adf81b4f0d59f402ed981d4251df0ba7b992299146/setuptools-67.6.1.tar.gz
