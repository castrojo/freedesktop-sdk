kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b
    suffix: 
      a9/6e/6b41e654bbdcef90c6b9e7f280bf7cbd756dc2560ce76214f5cdbc4ddab5/Mako-1.3.0.tar.gz
