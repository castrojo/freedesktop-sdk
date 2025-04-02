kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: 3e18d6afe3f855736022748606def2000af18e90253fb8b4d698b51f61e21283
    suffix: 
      a1/d4/4e0e25aabd94f289b7d47da8293a3563e73ac1a4f7e9caddf11b6eeaf52d/multidict-6.3.1.tar.gz
