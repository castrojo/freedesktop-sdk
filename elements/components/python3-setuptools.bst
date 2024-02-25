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
  ref: v69.1.1-0-g8c45d6e445a8ca5f5a1fd724a80a5c418fe36780
- kind: patch
  path: patches/setuptools/fix-version.patch
