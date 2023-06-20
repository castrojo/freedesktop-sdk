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
  ref: v68.0.0-0-g49fec9fafb0e23e0dde52d3c4c410d23a2de9b0d
- kind: patch
  path: patches/setuptools/fix-version.patch
