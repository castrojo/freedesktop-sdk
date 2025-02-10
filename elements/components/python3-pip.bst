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
    sha256sum: 88f96547ea48b940a3a385494e181e29fb8637898f88d88737c5049780f196ea
    suffix: 
      70/53/b309b4a497b09655cb7e07088966881a57d082f48ac3cb54ea729fd2c6cf/pip-25.0.1.tar.gz
