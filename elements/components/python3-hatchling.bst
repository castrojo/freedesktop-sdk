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
- components/python3-trove-classifiers.bst

variables:
  command-subdir: backend

sources:
- kind: git_repo
  url: github:pypa/hatch.git
  track: hatchling-*
  ref: hatchling-v1.26.1-0-gc1a3c6b4c86ea2affe4734b54578f032fe5d0003
