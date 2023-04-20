kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  ref:
    sha256sum: 1909688f5d7b521a60c396d20bba9e47a1b2d2784bfb085401e1e1e7d29a29a8
    suffix: 0a/70/1500f05bddb16d795b29fac42954b3c8764c82367b8326c10f038471ae7f/Cython-0.29.34.tar.gz
