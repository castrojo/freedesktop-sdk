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
    sha256sum: f3157624b7558b914cb039fd1af735e5e8049a87c817cc215109ad1c8779df76
    suffix: 
      1e/bf/82c351342972702867359cfeba5693927efe0a8dd568165490144f554b18/cffi-1.17.0.tar.gz
