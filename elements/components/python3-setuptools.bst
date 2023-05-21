kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 62642358adc77ffa87233bc4d2354c4b2682d214048f500964dbe760ccedf102
    suffix: 03/20/630783571e76e5fa5f3e9f29398ca3ace377207b8196b54e0ffdf09f12c1/setuptools-67.8.0.tar.gz
