kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst


sources:
- kind: pypi
  name: idna
  ref:
    sha256sum: 12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9
    suffix: 
      f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz
