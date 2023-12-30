kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/libxml2.bst
- components/libxslt.bst
- components/python3.bst

sources:
- kind: pypi
  name: lxml
  ref:
    sha256sum: 9165c82bcccf0249feff82cd1fba202e4ce26c25dc69040a0d2c2d0e49cbeba3
    suffix: 
      28/0b/1040061fa941b0b2cac73dd5d0e05cddd3d59f1bffbaab8049e2f5ee98a9/lxml-5.0.0.tar.gz
