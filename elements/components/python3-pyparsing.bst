kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyparsing
  ref:
    sha256sum: 2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb
    suffix: 71/22/207523d16464c40a0310d2d4d8926daffa00ac1f5b1576170a32db749636/pyparsing-3.0.9.tar.gz
