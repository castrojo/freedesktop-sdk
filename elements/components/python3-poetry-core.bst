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
    sha256sum: d145ae121cf79118a8901b60f2c951c4edcc16f55eb8aaefc156aa33aa921f07
    suffix: ea/47/929cccb98445b627e3a42f29290b3f6dc6c21f3dc0ba7b3bf16215298f94/poetry-core-1.1.0.tar.gz
