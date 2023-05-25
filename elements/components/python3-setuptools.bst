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
  ref: v67.8.0-0-g1aed0ff9ba8091f127cd3638bd26661fa0ff8371
- kind: patch
  path: patches/setuptools/fix-version.patch
