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
  ref: v69.5.1-0-gff58075cdf3459ecdf73486d2a83cecdd70c7e4a
- kind: patch
  path: patches/setuptools/fix-version.patch
