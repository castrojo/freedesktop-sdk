kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: cleo
  ref:
    sha256sum: 0b2c880b5d13660a7ea651001fb4acb527696c01f15c9ee650f377aa543fd523
    suffix: 
      3c/30/f7960ed7041b158301c46774f87620352d50a9028d111b4211187af13783/cleo-2.1.0.tar.gz
