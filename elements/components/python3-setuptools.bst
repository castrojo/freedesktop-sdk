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
  ref: v68.2.2-0-g2255e6366c70b9813d115ae0a0bba329affbd0ac
- kind: patch
  path: patches/setuptools/fix-version.patch
