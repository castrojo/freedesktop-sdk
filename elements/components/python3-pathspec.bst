kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pathspec
  ref:
    sha256sum: c57e16065a97b7beb175f13c84d27cb05f7b7315741c2fbd5de541042f4ea6e1
    suffix: 
      b2/18/c365a967920edd1139664a3617648fd33a54edf4f919973924009630faf5/pathspec-0.12.0.tar.gz
