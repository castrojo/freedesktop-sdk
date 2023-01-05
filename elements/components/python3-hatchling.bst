kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-packaging.bst
- components/python3-editables.bst
- components/python3-pathspec.bst
- components/python3-pluggy.bst

sources:
- kind: pypi
  name: hatchling
  ref:
    sha256sum: 8a6d719d96653a0f3901072b12710c9c3cc934f9061b443775c6789b45333495
    suffix: f5/ea/3ed5a7ecdd8a8f7e84cffd3b5ec24279a09ce2694c218ff922c35c6f1a77/hatchling-1.12.2.tar.gz
