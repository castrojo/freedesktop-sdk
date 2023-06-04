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
    sha256sum: 76dee5108f929b7eb9102df0a1bf88fa3247d68a44ff1f395e1cf32eaab0c6fa
    suffix: 8b/3a/81707297cb23b1d1f3117ee7545cfb9cbd87bc7707808e91799b8badabe1/hatchling-1.17.1.tar.gz
