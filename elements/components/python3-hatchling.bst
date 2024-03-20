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
    sha256sum: adf5d32ab10ac59272cd0bcae9c8193288841860025f2c51df971dae161f8683
    suffix: 
      6a/a1/14f87714ecabcb25d2fb5d7640fd2b5cdd46bb4fe91ca5b3456e84127a8c/hatchling-1.22.3.tar.gz
