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
  ref: v69.4.0-0-g88a8caebc82a706da03c8002fc0f77ffb110fe64
- kind: patch
  path: patches/setuptools/fix-version.patch
