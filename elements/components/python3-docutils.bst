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
    sha256sum: d2fb50923a313532b6d41a77776d24cb459a594be9b7e4afa1fbcb5bda1893e6
    suffix: 
      e4/47/d869000fb74438584858acc628a364b277fc012695f0dfd513cb10f99768/docutils-0.22.1.tar.gz
