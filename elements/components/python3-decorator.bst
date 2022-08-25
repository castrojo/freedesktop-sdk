kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: decorator
  include:
  - 4[.]4[.].*
  ref:
    sha256sum: e3a62f0520172440ca0dcc823749319382e377f37f140a0b99ef45fecb84bfe7
    suffix: da/93/84fa12f2dc341f8cf5f022ee09e109961055749df2d0c75c5f98746cfe6c/decorator-4.4.2.tar.gz
