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
    sha256sum: a160a170f3331d9ca1a0247eb1cd79c758879f1f81158f9cd05bbb5df80bea5c
    suffix: 3d/ab/21fa8d1ecf5648559f056fda732b0f9fca0585eb2688252e67f70e74deaf/pip-23.2.tar.gz
