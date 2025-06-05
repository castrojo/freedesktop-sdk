kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython-3.bst
- components/python3-expandvars.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: frozenlist
  include:
  - "1.6.0"
  ref:
    sha256sum: b99655c32c1c8e06d111e7f41c06c29a5318cb1835df23a45518e02a47c63b68
    suffix: 
      ee/f4/d744cba2da59b5c1d88823cf9e8a6c74e4659e2b27604ed973be2a0bf5ab/frozenlist-1.6.0.tar.gz
