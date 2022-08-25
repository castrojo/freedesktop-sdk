kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/pkg-config.bst

depends:
- components/libffi.bst
- components/python3.bst
- components/python3-pycparser.bst

sources:
- kind: pypi
  name: cffi
  ref:
    sha256sum: 920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954
    suffix: 00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a/cffi-1.15.0.tar.gz
