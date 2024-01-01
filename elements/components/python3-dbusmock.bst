kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

runtime-depends:
- components/python3.bst
- components/python3-dbus.bst

sources:
- kind: pypi
  name: python-dbusmock
  ref:
    sha256sum: 1d7b3794af7b280942f7f6cda4d8bb5d17d8c7216000825cf8b43b6af8792d7d
    suffix: 
      a3/d7/c1775cc770066966cad9e48176dc75f3bdef2fb523fb131b797dc18cedb2/python-dbusmock-0.30.2.tar.gz
