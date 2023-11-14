kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst

depends:
- components/python3.bst


sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: df7aa8afb0148fa78488e7899b2c59b5f4ffcfa82e6c54ccb9dd37c1d7b52d54
    suffix: 
      36/dd/a6b232f449e1bc71802a5b7950dc3675d32c6dbc2a1bd6d71f065551adb6/urllib3-2.1.0.tar.gz
