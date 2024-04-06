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
    sha256sum: ca260a5adad376563dcd5df799e79ec1d5c0a3be41e2fbe335613c451772b09e
    suffix: 
      1d/20/114862141f3bc69e01884fd225600b0ca178b2dfd6fd84f100e06bf199ab/hatchling-1.22.5.tar.gz
