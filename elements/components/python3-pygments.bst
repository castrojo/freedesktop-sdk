kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pygments
  ref:
    sha256sum: 786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199
    suffix: 
      8e/62/8336eff65bcbc8e4cb5d05b55faf041285951b6e80f33e2bff2024788f31/pygments-2.18.0.tar.gz
