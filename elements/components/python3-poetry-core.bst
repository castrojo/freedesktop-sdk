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
    sha256sum: 41887261358863f25831fa0ad1fe7e451fc32d1c81fcf7710ba5174cc0047c6d
    suffix: 69/52/b73aade26e2487159ad2c1b5fd7cd2b76532e146dd36f99b4be4f741b13b/poetry_core-1.5.1.tar.gz
