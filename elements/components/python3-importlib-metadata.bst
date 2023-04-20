kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: 7a8bdf1bc3a726297f5cfbc999e6e7ff6b4fa41b26bba4afc580448624460045
    suffix: 9d/ce/dc7221b3044c7382d5abad27d2599e63b0e0ccabc49491244203ee1ded96/importlib_metadata-6.5.0.tar.gz
