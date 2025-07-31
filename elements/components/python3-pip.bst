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
  include:
  - "25.1.*"
  ref:
    sha256sum: 3de45d411d308d5054c2168185d8da7f9a2cd753dbac8acbfa88a8909ecd9077
    suffix: 
      59/de/241caa0ca606f2ec5fe0c1f4261b0465df78d786a38da693864a116c37f4/pip-25.1.1.tar.gz
