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
    sha256sum: 64b5e78305a5de347f2cd7ec8c12d704a3ef0cb85cc10c0ca5f73488d1c201f8
    suffix: 
      bc/ca/877e9b50c0092e6a9df860901309d9ec70e7dd0b077ee9bedc8bab24bb7f/trove-classifiers-2023.11.14.tar.gz
