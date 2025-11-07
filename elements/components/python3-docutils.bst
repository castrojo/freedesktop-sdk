kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: 21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd
    suffix: d9/02/111134bfeb6e6c7ac4c74594e39a59f6c0195dc4846afbeac3cba60f1927/docutils-0.22.3.tar.gz
