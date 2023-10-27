kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

sources:
- kind: pypi
  name: setuptools-rust
  ref:
    sha256sum: 5e02b7a80058853bf64127314f6b97d0efed11e08b94c88ca639a20976f6adc4
    suffix: 
      5c/70/ebdd0f6ec81cbbb696f8e9d40d41215e912b91132bae3f2232404c582b3a/setuptools-rust-1.8.0.tar.gz
