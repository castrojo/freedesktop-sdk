kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  ref:
    sha256sum: 4cf94875a8368bd89531a756df9a9ebe1f150e0f885030b461237bc7f2d905f2
    suffix: 78/1f/65a619c18b0ecd55ac165c7ed119c846051991d01c2cfc0ff7818e4573f0/importlib_resources-6.0.0.tar.gz
