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
    sha256sum: b1244db3f45b4ef5a00106a46612da107cdfaf85f1580b8e1c059fefc98b0930
    suffix: d4/de/983fb0275c7361345b0b4916f88048cae9ce38aa8e6099af2e990d61e304/hatchling-1.17.0.tar.gz
