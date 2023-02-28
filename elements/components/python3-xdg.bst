kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: xdg
  ref:
    sha256sum: 24278094f2d45e846d1eb28a2ebb92d7b67fc0cab5249ee3ce88c95f649a1c92
    suffix: 2a/b9/0e6e6f19fb75cf5e1758f4f33c1256738f718966700cffc0fde2f966218b/xdg-6.0.0.tar.gz
