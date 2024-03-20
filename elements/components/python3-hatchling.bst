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
  ref: hatchling-v1.22.3-0-g83b25a2cd750ce05fec68e04e8fd3079f7839ca3
