kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 4d3c92fac8f1118bb77a22181355e29c239cabfe2b9effdaa665c66b711136d7
    suffix: a1/29/f2ad3b78b9ebd24afa282eed9add27b47ef52b37291198021154b4b65166/setuptools-65.7.0.tar.gz
