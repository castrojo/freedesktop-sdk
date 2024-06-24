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
  ref: v70.1.0-0-g3466f9f1e14c4b0ef87299fef414f73600d4a46f
- kind: patch
  path: patches/setuptools/fix-version.patch
