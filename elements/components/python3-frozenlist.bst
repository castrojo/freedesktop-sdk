kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: frozenlist
  include:
  - '1.4.0'
  ref:
    sha256sum: 09163bdf0b2907454042edb19f887c6d33806adc71fbd54afc14908bfdc22251
    suffix: 8c/1f/49c96ccc87127682ba900b092863ef7c20302a2144b3185412a08480ca22/frozenlist-1.4.0.tar.gz
