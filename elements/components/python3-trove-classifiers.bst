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
    sha256sum: c31a7e92f965f060a244b57d8ed5ee6f53fcb413ee17ce790e00577cb369ad99
    suffix: 
      d4/6c/0179b697afd39e7727cada2f5de4b98af1341b5c4728e576922f4e0a75ec/trove-classifiers-2023.11.22.tar.gz
