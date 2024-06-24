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
    sha256sum: 7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262
    suffix: 
      a3/51/8a4a67a8174ce59cf49e816e38e9502900aea9b4af672d0127df8e10d3b0/hatchling-1.25.0.tar.gz
