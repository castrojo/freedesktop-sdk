kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: cleo
  ref:
    sha256sum: bb5e4f70db83a597575ec86a1ed8fc56bd80934cfea3db97a23ea50c03b78382
    suffix: 01/95/ea58b0bbfa2bfc71d6752aa788baef43425d5388095b08bde8d8e513bc89/cleo-1.0.0.tar.gz
