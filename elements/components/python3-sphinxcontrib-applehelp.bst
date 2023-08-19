kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-applehelp
  ref:
    sha256sum: 39fdc8d762d33b01a7d8f026a3b7d71563ea3b72787d5f00ad8465bd9d6dfbfa
    suffix: 1c/5a/fce19be5d4db26edc853a0c34832b39db7b769b7689da027529767b0aa98/sphinxcontrib_applehelp-1.0.7.tar.gz
