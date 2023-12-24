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
    sha256sum: aa865e5345aa7626583b83f70e7956c576c24dbc19491ce7fd19281cfef49690
    suffix: 
      e8/56/dda0b3d251a479c7fc2d634c723ab1d1a84294607213720daa7916f2c942/python-dbusmock-0.30.1.tar.gz
