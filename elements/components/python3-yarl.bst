kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

runtime-depends:
- components/python3-idna.bst
- components/python3-multidict.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: pypi
  name: yarl
  include:
  - '1.9.2'
  ref:
    sha256sum: 04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571
    suffix: 5f/3f/04b3c5e57844fb9c034b09c5cb6d2b43de5d64a093c30529fd233e16cf09/yarl-1.9.2.tar.gz
