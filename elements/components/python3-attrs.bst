kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: attrs
  ref:
    sha256sum: 29adc2665447e5191d0e7c568fde78b21f9672d344281d0c6e1ab085429b22b6
    suffix: 1a/cb/c4ffeb41e7137b23755a45e1bfec9cbb76ecf51874c6f1d113984ecaa32c/attrs-22.1.0.tar.gz
