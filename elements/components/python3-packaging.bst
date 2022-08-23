kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyparsing.bst

sources:
- kind: pypi
  name: packaging
  ref:
    sha256sum: dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb
    suffix: df/9e/d1a7217f69310c1db8fdf8ab396229f55a699ce34a203691794c5d1cad0c/packaging-21.3.tar.gz
