kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-editables.bst
- components/python3-packaging.bst
- components/python3-pathspec.bst
- components/python3-pluggy.bst
- components/python3-tomli.bst
- components/python3-trove-classifiers.bst

sources:
- kind: pypi
  name: hatchling
  ref:
    sha256sum: 50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca
    suffix: e3/57/87da2c5adc173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637/hatchling-1.18.0.tar.gz
