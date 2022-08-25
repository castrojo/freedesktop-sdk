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
  ref:
    sha256sum: 45399b46d60c253327a460e99856752009fcee5f5d3c80b2f7c0cae1c38d56dd
    suffix: f6/da/46d1b3d69a9a0835dabf9d59c7eb0f1600599edd421a4c5a15ab09f527e0/yarl-1.7.2.tar.gz
