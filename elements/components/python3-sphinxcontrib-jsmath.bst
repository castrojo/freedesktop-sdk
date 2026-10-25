kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:sphinx-doc/sphinxcontrib-jsmath.git
  track: "*.*.*"
  ref: 2.0.0-0-g420ba4ebb0cabff9100e46714c67074f33f44fc5
- kind: patch
  path: patches/python3-sphinxcontrib-jsmath/reproducibility.patch
