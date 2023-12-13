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
    sha256sum: 32ec66fa03401f54cea109714cecc56a1087d7846ebe72f6e49fa873a70bc3b2
    suffix: 
      ef/1a/32a6e956772757610117721c2e5b14f76efbdae7074c0f48e2795c303761/hatchling-1.19.1.tar.gz
