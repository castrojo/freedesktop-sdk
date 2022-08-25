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
    sha256sum: 951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118
    suffix: 51/be/c4dce945cf7de2dc38d94cf724525f2a97d83b18403eeeb87eecb715dada/poetry-core-1.0.8.tar.gz
