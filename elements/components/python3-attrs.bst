kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: attrs
  ref:
    sha256sum: c9227bfc2f01993c03f68db37d1d15c9690188323c067c641f1a35ca58185f99
    suffix: 21/31/3f468da74c7de4fcf9b25591e682856389b3400b4b62f201e65f15ea3e07/attrs-22.2.0.tar.gz
