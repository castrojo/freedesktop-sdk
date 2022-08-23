kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyexpect
  ref:
    sha256sum: 96e900d6af928a94c2a75b4935ddda44872c218121d0467c549ae19e7608a9a2
    suffix: 73/2e/6993c578246bd988b67d081bcf57d2710d5e9cf8ccb16e550f7f07a9df3c/pyexpect-1.0.21.tar.gz
config:
  build-commands:
  - rm -r tests
