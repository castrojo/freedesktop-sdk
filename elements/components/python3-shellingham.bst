kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: shellingham
  ref:
    sha256sum: 72fb7f5c63103ca2cb91b23dee0c71fe8ad6fbfd46418ef17dbe40db51592dad
    suffix: bd/e6/fdf53ebbf08016dba98f2b047d4db95790157f0e2eed3b14bb5754271475/shellingham-1.5.0.tar.gz
