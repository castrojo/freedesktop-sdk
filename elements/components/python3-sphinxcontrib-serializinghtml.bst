kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-serializinghtml
  ref:
    sha256sum: 0c64ff898339e1fac29abd2bf5f11078f3ec413cfe9c046d3120d7ca65530b54
    suffix: 5c/41/df4cd017e8234ded544228f60f74fac1fe1c75bdb1e87b33a83c91a10530/sphinxcontrib_serializinghtml-1.1.9.tar.gz
