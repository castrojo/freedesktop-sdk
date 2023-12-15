kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-editables.bst
- components/python3-packaging.bst
- components/python3-pathspec.bst
- components/python3-pluggy.bst
- components/python3-tomli.bst
- components/python3-trove-classifiers.bst

sources:
- kind: pypi
  name: hatchling
  ref:
    sha256sum: 0e0893cbe3d5f9275fc0e5b629087fc23b17abd7065e4db0a310e0a0237bc945
    suffix: 
      0d/ee/2afbbb1e8e17a792e83e894e35e4a151dff121aa841ebdbe92f4b51779fe/hatchling-1.20.0.tar.gz
