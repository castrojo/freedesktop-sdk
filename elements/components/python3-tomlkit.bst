kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: 1be06879860054a26faba7acf2af62b45c94aa43b00a5f87fc445c5f930ad754
    suffix: 
      3e/4a/5b5a13efd33514374e872a084de9968a384c87fbfeb8959ca90551c0e2f9/tomlkit-0.13.1.tar.gz
