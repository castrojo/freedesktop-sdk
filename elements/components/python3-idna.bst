kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

sources:
- kind: pypi
  name: idna
  ref:
    sha256sum: d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603
    suffix: 
      e8/ac/e349c5e6d4543326c6883ee9491e3921e0d07b55fdf3cce184b40d63e72a/idna-3.8.tar.gz
