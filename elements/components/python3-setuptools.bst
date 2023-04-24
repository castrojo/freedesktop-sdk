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
  ref: v67.6.0-0-gbe6c0218bcba78dbd4ea0b5a8bb9acd5d5306240
- kind: patch
  path: patches/setuptools/fix-version.patch
