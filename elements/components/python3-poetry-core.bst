kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-intreehooks.bst
- components/python3-toml.bst

sources:
- kind: pypi
  name: poetry-core
  ref:
    sha256sum: 514bd33c30e0bf56b0ed44ee15e120d7e47b61ad908b2b1011da68c48a84ada9
    suffix: ba/80/373557c83c79d0cc7add2c123be04c29d81b0ac3e631257d8d7dc0a3cf9c/poetry_core-1.4.0.tar.gz
