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
    sha256sum: ee42f2f8c1d4bcfe35f746e472f07633570d485fab45407effc0379270a3bb03
    suffix: 83/02/20d6d8f5e79c6cd5d09ddec9e97c1e02631159587c9041ae53df5819b0ef/trove-classifiers-2023.3.9.tar.gz
