kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: asn1crypto
  ref:
    sha256sum: 13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c
    suffix: de/cf/d547feed25b5244fcb9392e288ff9fdc3280b10260362fc45d37a798a6ee/asn1crypto-1.5.1.tar.gz
