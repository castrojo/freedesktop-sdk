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
    sha256sum: 8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e
    suffix: 
      4f/2a/c34d71531d1e1c9a5029bb73eb3816285befd0fffd7c63ffa0544253dca8/hatchling-1.22.4.tar.gz
