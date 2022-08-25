kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: cleo
  ref:
    sha256sum: 3d0e22d30117851b45970b6c14aca4ab0b18b1b53c8af57bed13208147e4069f
    suffix: a5/36/943c12bc9b56f5fc83661558c576a3d95df0d0f9c153f87ee4c19647025b/cleo-0.8.1.tar.gz
