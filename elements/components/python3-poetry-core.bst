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
    sha256sum: 0f9b0de39665f36d6594657e7d57b6f463cc10f30c28e6d1c3b9ff54c26c9ac3
    suffix: 20/e8/e0a80cc355bc207fb1760160344e978f39d683c35e1230f71b8916bf3a50/poetry_core-1.6.1.tar.gz
