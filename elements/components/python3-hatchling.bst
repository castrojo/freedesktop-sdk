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
    sha256sum: 41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff8240797d012510547b0
    suffix: 
      2d/18/dbb6b0c167c21429e4f4b03744f5da79d4a534f12c13fd41d2d3033b96da/hatchling-1.24.2.tar.gz
