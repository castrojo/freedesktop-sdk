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
    sha256sum: 52ad024a44d46602084fd91c0c467ab95b7ecf27c4e2168e0d2160623f18c0a2
    suffix: 02/e0/7f5769a1131c0565c7a7153681f5a1ce2782a196be220fc1eb5409c2ba40/python-dbusmock-0.28.4.tar.gz
