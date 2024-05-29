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
  ref: v70.0.0-0-g5cbf12a9b63fd37985a4525617b46576b8ac3a7b
- kind: patch
  path: patches/setuptools/fix-version.patch
