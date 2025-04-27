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
    sha256sum: 272bdd1289f80165e9070a4f881e8f9e1001bbb50378561d1af20e49bf5a2200
    suffix: 
      79/67/c06f625e2968c417052b3a4a0eef40656d5d4d44033e57b40ec474af1d28/pip-25.1.tar.gz
