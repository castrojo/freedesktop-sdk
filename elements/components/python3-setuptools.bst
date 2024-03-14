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
  ref: v69.2.0-0-g6ee23bf0579c52e1cbe7c97fc20fd085ff2a25c7
- kind: patch
  path: patches/setuptools/fix-version.patch
