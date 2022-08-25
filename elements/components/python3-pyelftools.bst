kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyelftools
  ref:
    sha256sum: 53e5609cac016471d40bd88dc410cd90755942c25e58a61021cfdf7abdfeacff
    suffix: e9/80/00247e07e32e85b964ef81c9fd556b332f85e743e3eaf332325f579c82eb/pyelftools-0.28.tar.gz
