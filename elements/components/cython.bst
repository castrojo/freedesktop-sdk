kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  include:
  - '0.29.*'
  ref:
    sha256sum: f813d4a6dd94adee5d4ff266191d1d95bf6d4164a4facc535422c021b2504cfb
    suffix: 2a/97/8cc3fe7c6de4796921236a64d00ca8a95565772e57f0d3caae68d880b592/Cython-0.29.37.tar.gz
