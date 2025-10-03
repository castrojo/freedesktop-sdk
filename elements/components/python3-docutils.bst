kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: 9fdb771707c8784c8f2728b67cb2c691305933d68137ef95a75db5f4dfbc213d
    suffix: 
      4a/c0/89fe6215b443b919cb98a5002e107cb5026854ed1ccb6b5833e0768419d1/docutils-0.22.2.tar.gz
