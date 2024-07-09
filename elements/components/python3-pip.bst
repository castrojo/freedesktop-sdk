kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst


sources:
- kind: pypi
  name: pip
  ref:
    sha256sum: e5458a0b89f2755e0ee8c0c77613fe5273e05f337907874d64f13171a898a7ff
    suffix: 
      12/3d/d899257cace386bebb7bdf8a872d5fe3b935cc6381c3ddb76d3e5d99890d/pip-24.1.2.tar.gz
