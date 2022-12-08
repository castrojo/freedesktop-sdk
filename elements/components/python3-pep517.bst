kind: pyproject

build-depends:
- components/python3-flit-core.bst
- components/python3-installer.bst

config:
  build-commands:
  - python3 -mflit_core.wheel

sources:
- kind: pypi
  name: pep517
  ref:
    sha256sum: ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59
    suffix: 4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0/pep517-0.13.0.tar.gz
