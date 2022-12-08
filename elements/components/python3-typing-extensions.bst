kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: typing-extensions
  ref:
    sha256sum: 1511434bb92bf8dd198c12b1cc812e800d4181cfcb867674e0f8279cc93087aa
    suffix: e3/a7/8f4e456ef0adac43f452efc2d0e4b242ab831297f1bac60ac815d37eb9cf/typing_extensions-4.4.0.tar.gz
