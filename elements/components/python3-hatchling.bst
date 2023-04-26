kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-editables.bst
- components/python3-packaging.bst
- components/python3-pathspec.bst
- components/python3-pluggy.bst
- components/python3-tomli.bst
- components/python3-trove-classifiers.bst

sources:
- kind: pypi
  name: hatchling
  ref:
    sha256sum: 55fbc88cbd0d96c09c3e9392b51db513fd4cb4caf47615d65f935a5ef1756133
    suffix: aa/d2/613087e785e4631a96d8b53688e28d5cd55a67caee9000e6408c0c58bcd2/hatchling-1.14.1.tar.gz
