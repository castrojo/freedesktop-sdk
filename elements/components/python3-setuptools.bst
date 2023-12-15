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
  ref: v69.0.3-0-ge92440ad6210b21f3ede64d7eb69dead94b37d3a
- kind: patch
  path: patches/setuptools/fix-version.patch
