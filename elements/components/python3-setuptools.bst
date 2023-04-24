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
  ref: v67.7.1-0-g53e282429043af3ed96c1684cf81b62e0471c711
- kind: patch
  path: patches/setuptools/fix-version.patch
