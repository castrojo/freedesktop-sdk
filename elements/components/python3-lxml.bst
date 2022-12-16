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
    sha256sum: 2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67
    suffix: 06/5a/e11cad7b79f2cf3dd2ff8f81fa8ca667e7591d3d8451768589996b65dec1/lxml-4.9.2.tar.gz
