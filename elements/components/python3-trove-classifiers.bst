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
    sha256sum: 8a6242bbb5c9ae88d34cf665e816b287d2212973c8777dfaef5ec18d72ac1d03
    suffix: 
      98/01/e2bc94b71ebaa2c8092cd392caaf5ad42d55c5aaa21a575ab7684e080851/trove_classifiers-2024.5.22.tar.gz
