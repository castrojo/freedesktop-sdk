kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: 9e5421e176ef5ab4c0ad896624e87a7b2f07aca746c9b2aa305952800cb8eecb
    suffix: ab/47/b47d02b741e0aa6f998fc80457d3dfc05cb7732ef480597c2971cbc79260/zipp-3.14.0.tar.gz
