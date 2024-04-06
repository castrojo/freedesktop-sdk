kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: typing-extensions
  ref:
    sha256sum: 83f085bd5ca59c80295fc2a82ab5dac679cbe02b9f33f7d83af68e241bea51b0
    suffix: 
      f6/f3/b827b3ab53b4e3d8513914586dcca61c355fa2ce8252dea4da56e67bf8f2/typing_extensions-4.11.0.tar.gz
