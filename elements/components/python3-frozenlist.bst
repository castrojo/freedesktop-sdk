kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: frozenlist
  ref:
    sha256sum: 58bcc55721e8a90b88332d6cd441261ebb22342e238296bb330968952fbb3a6a
    suffix: e9/10/d629476346112b85c912527b9080944fd2c39a816c2225413dbc0bb6fcc0/frozenlist-1.3.3.tar.gz
