kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyasn1
  ref:
    sha256sum: 3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706ccd82328cfc8f64c
    suffix: 
      4a/a3/d2157f333900747f20984553aca98008b6dc843eb62f3a36030140ccec0d/pyasn1-0.6.0.tar.gz
