kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: 71b952e5721688937fb02cf9d354dbcf0785066149d2855e44531ebdd2b65d73
    suffix: ff/04/58b4c11430ed4b7b8f1723a5e4f20929d59361e9b17f0872d69681fd8ffd/tomlkit-0.11.6.tar.gz
