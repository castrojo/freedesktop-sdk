kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-qthelp
  ref:
    sha256sum: 053dedc38823a80a7209a80860b16b722e9e0209e32fea98c90e4e6624588ed6
    suffix: 
      ac/29/705cd4e93e98a8473d62b5c32288e6de3f0c9660d3c97d4e80d3dbbad82b/sphinxcontrib_qthelp-1.0.7.tar.gz
