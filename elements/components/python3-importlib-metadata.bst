kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: 43ce9281e097583d758c2c708c4376371261a02c34682491a8e98352365aad20
    suffix: e2/d8/3d431bade4598ad9e33be9da41d15e6607b878008e922d122659ab01b077/importlib_metadata-6.1.0.tar.gz
