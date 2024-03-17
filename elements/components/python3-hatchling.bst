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
    sha256sum: f2dfce8e5d389c53c41c87f5c643c5ef2f9519510eaaddda0aac63eb52470684
    suffix: 
      5e/45/c72ece34dd03e623ce9fc14c180ef164df732726dd0a19fc25d24bef1893/hatchling-1.22.2.tar.gz
