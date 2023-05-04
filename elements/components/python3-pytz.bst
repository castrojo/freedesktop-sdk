kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pytz
  ref:
    sha256sum: 1d8ce29db189191fb55338ee6d0387d82ab59f3d00eac103412d64e0ebd0c588
    suffix: 5e/32/12032aa8c673ee16707a9b6cdda2b09c0089131f35af55d443b6a9c69c1d/pytz-2023.3.tar.gz
