kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-packaging.bst
- components/python3-editables.bst
- components/python3-pathspec.bst
- components/python3-pluggy.bst

sources:
- kind: pypi
  name: hatchling
  ref:
    sha256sum: f8d275a2cc720735286b7c2e2bc35da05761e6d3695c2fa416550395f10c53c7
    suffix: 26/d3/96fa0ee6328ee141f6be444bd913d68c1105f5cca3f7622bced939a34bc5/hatchling-1.13.0.tar.gz
