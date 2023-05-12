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
    sha256sum: b42140c799da7bc43d89b7ced4d31ea1c375b34595cec52a11c8a245839d9af4
    suffix: de/a6/aea15316c8dc1ec0fc8a0fe622ddc81feb162677005847e7f7db30d36364/hatchling-1.16.1.tar.gz
