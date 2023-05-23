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
    sha256sum: 0c7669400ea1ce940eeb5af069d1d0fcb7de1caa796ca2df4a326247aba8e8c6
    suffix: 4b/d1/8b03fea03e24628678a9808c49269256484597a0f2b9c5c52d83519e2521/trove-classifiers-2023.5.22.tar.gz
