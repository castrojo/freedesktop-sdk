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
    sha256sum: 462ea91df03ff5d52813b5613fec1313a1a2059d2e37343e572b3f979867c5da
    suffix: 2f/3c/97749f46774cf2ccff1c2956de5dfa084f151fe03bb20ebe628a1bba2cea/hatchling-1.14.0.tar.gz
