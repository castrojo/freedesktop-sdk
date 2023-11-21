kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst
- components/python3-wheel.bst

depends:
- bootstrap-import.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/setuptools.git
  track: v*
  ref: v69.0.2-0-g4f6449f409322fa63408881860ed9097c2ab0af8
- kind: patch
  path: patches/setuptools/fix-version.patch
