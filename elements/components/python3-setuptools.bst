kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 7c7854ee1429a240090297628dc9f75b35318d193537968e2dc14010ee2f5bca
    suffix: 63/2e/e1f3e1b02d7ff0baa356413e93ad8a88706accd6b3538e18204a8a00c42d/setuptools-63.4.1.tar.gz
