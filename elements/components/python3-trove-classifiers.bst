kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-calver.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: trove-classifiers
  ref:
    sha256sum: 2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939
    suffix: 
      5b/fa/49b6a09e4f389d4d9406d2947a685de1462ffb676ea6e61c50905e27b0f4/trove-classifiers-2023.10.18.tar.gz
