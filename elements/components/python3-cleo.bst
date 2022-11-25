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
    sha256sum: eb4b2e1f3063c11085cebe489a6e9124163c226575a3c3be69b2e51af4a15ec5
    suffix: 83/51/b2609f0998671bef90b83407e75dbd8e3812e513e88f548d1b10b48a1d12/cleo-2.0.1.tar.gz
