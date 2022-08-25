kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-contextlib2.bst

sources:
- kind: pypi
  name: schema
  ref:
    sha256sum: f06717112c61895cabc4707752b88716e8420a8819d71404501e114f91043197
    suffix: 4e/e8/01e1b46d9e04cdaee91c9c736d9117304df53361a191144c8eccda7f0ee9/schema-0.7.5.tar.gz
