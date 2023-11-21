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
  ref: v69.0.0-0-g536d4a82059747873cab87654567a721489e1cd3
- kind: patch
  path: patches/setuptools/fix-version.patch
