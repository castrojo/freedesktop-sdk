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
  ref: v68.2.1-0-g0120605db966af66207d996b82320ee676fabbf1
- kind: patch
  path: patches/setuptools/fix-version.patch
