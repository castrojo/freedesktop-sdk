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
    sha256sum: ceccec95487e46c63a41761fbac5211b809bca22658e25a049f4c7da96269f71
    suffix: 27/ba/611a561ef300abdae81a576445334fb7a41e62c295b050338a4f54fa76d4/poetry-core-1.2.0.tar.gz
