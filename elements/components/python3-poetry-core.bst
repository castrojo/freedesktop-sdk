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
    sha256sum: 253521bb7104e1df81f64d7b49ea1825057c91fa156d7d0bd752fefdad6f8c7a
    suffix: 57/bb/2435fef60bb01f6c0891d9482c7053b50e90639f0f74d7658e99bdd4da69/poetry_core-1.5.0.tar.gz
