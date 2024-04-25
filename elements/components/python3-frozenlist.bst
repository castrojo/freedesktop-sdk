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
  ref:
    sha256sum: c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b
    suffix: 
      cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085/frozenlist-1.4.1.tar.gz
