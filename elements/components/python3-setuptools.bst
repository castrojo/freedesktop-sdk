kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

config:
  configure-commands:
    (<):
    - |
      python3 bootstrap.py

sources:
- kind: pypi
  name: setuptools
  include:
  - 59[.].*[.].*
  ref:
    sha256sum: 09980778aa734c3037a47997f28d6db5ab18bdf2af0e49f719bfc53967fd2e82
    suffix: ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725/setuptools-59.8.0.tar.gz
