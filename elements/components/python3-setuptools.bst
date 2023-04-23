kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: bb16732e8eb928922eabaa022f881ae2b7cdcfaf9993ef1f5e841a96d32b8e0c
    suffix: 01/18/73f7ca619f72b22300493451350214d3a035e7fa8f17ce31db2da24fe0c9/setuptools-67.7.1.tar.gz
