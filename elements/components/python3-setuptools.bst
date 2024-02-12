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
  ref: v69.1.0-0-gbc6b031574efae1be4e0940bc8f262755149e216
- kind: patch
  path: patches/setuptools/fix-version.patch
