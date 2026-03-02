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
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/hatch.git
  track: hatchling-*
  ref: hatchling-v1.29.0-0-g1a74daa6f554e2ec89f2641288e44ed39e5507cc
