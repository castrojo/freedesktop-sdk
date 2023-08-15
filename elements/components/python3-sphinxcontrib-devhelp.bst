kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-devhelp
  ref:
    sha256sum: 63b41e0d38207ca40ebbeabcf4d8e51f76c03e78cd61abe118cf4435c73d4212
    suffix: 2e/f2/6425b6db37e7c2254ad661c90a871061a078beaddaf9f15a00ba9c3a1529/sphinxcontrib_devhelp-1.0.5.tar.gz
