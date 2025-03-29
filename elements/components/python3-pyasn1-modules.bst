kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyasn1.bst

sources:
- kind: pypi
  name: pyasn1-modules
  ref:
    sha256sum: 677091de870a80aae844b1ca6134f54652fa2c8c5a52aa396440ac3106e941e6
    suffix: 
      e9/e6/78ebbb10a8c8e4b61a59249394a4a594c1a7af95593dc933a349c8d00964/pyasn1_modules-0.4.2.tar.gz
