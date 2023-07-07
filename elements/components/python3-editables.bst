kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: editables
  ref:
    sha256sum: dc322c42e7ccaf19600874035a4573898d88aadd07e177c239298135b75da772
    suffix: 43/8a/a060ff3e75328015150f680b4b4bc4617644aaef199ece380342a334d78f/editables-0.4.tar.gz
