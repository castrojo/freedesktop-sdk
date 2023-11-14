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
    sha256sum: 87d8599d890b719c81c7e33cdb2813d5965e5958984bff1b913e161f0d6a5286
    suffix: 
      5b/01/bbb66e3899bd0078559735f7046db0e906a29e9b12118ce39b79a194ad5f/trove-classifiers-2023.11.13.tar.gz
