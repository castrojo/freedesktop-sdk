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
    sha256sum: c6556c3b1ec5b8668e6ef5a4494726bc41d31907339425e194e78a6178436c14
    suffix: 01/10/dec07a2308b68c5b89432dcc80b0dd8882e45e4c90b5851552bb22247ca7/poetry_core-1.5.2.tar.gz
