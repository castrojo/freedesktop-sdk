kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: certifi
  ref:
    sha256sum: 539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082
    suffix: 98/98/c2ff18671db109c9f10ed27f5ef610ae05b73bd876664139cf95bd1429aa/certifi-2023.7.22.tar.gz
