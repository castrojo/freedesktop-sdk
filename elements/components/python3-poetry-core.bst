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
    sha256sum: a9c7296a12d6c8e4f8aa50a66ef3c967b2b50fba634da144d358e676fad9989f
    suffix: b8/7d/8654777b23919a77ff34f0ef5ba048102fb0d87e23515ccd715e53ac726d/poetry_core-1.6.0.tar.gz
