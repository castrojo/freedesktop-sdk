kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

runtime-depends:
- components/python3-idna.bst
- components/python3-multidict.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: pypi
  name: yarl
  ref:
    sha256sum: 5ce0bcab7ec759062c818d73837644cde567ab8aa1e0d6c45db38dfb7c284441
    suffix: ed/02/695dd9ec40214fbad98ffc82e97bbe15d99cb798b837c5af38b5649a20cd/yarl-1.9.1.tar.gz
