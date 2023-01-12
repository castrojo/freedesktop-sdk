kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: toposort
  ref:
    sha256sum: f41a34490d44934b533a7bdaff979ee8a47203fd2d8a746db83f2d5ab12458b9
    suffix: 8d/c3/44e51b42160145e4ebeb7d86ab93bd933fa9498f94e183ef8a47c6de8b2f/toposort-1.9.tar.gz
