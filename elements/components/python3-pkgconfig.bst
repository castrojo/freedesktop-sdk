kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-nose.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pkgconfig
  include:
  - 1.1.0
  ref:
    sha256sum: 709daaf077aa2b33bedac12706373412c3683576a43013bbaa529fc2769d80df
    suffix: 87/35/4af9634270c00e3411cf951b7e0ea796c262922357cfc7609a86d31f072b/pkgconfig-1.1.0.tar.gz
