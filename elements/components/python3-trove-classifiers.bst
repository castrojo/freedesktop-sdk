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
    sha256sum: fd5a1546283be941f47540a135bdeae8fb261380a6a204d9c18012f2a1b0ceae
    suffix: 4a/ed/789b86a020378341936d0edc570130451915cee92db440bb513cd5b712a1/trove-classifiers-2023.5.24.tar.gz
