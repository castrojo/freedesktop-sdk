kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: a8f6e213b4b0661f590ccf40de95d28a177cd747d098624ad3f69c40287297e9
    suffix: 4c/61/86c94ae2cccb05749abfb1b2961125d40368c8f03ac59275550c45e634f1/setuptools-65.4.0.tar.gz
