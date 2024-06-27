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
    sha256sum: 5aa64f65e1952733ee0a9a9b1f52496ebdb3f3077cc46f80a16d983b58d1180a
    suffix: 
      c0/d0/9641dc7b05877874c6418f8034ddefc809495e65caa14d38c7551cd114bb/pip-24.1.1.tar.gz
