kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-calver.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: trove-classifiers
  ref:
    sha256sum: c46d6e40a9581599b16c712e0164fec3764872a4085c673c07559787caedb867
    suffix: 33/75/4e87c5021949ece4171eddebb11ef30d7e787a99c4d24c7dc383dd306a6c/trove-classifiers-2023.5.2.tar.gz
