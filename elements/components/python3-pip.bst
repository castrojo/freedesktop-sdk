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
    sha256sum: 1fcaa041308d01f14575f6d0d2ea4b75a3e2871fe4f9c694976f908768e14174
    suffix: 
      1f/7f/4da15e07ccd11c84c1ccc8f6e24288d5e76c99441bf80e315b33542db951/pip-23.3.1.tar.gz
