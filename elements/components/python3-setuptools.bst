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
  ref: v67.7.2-0-ga592795b81a51d73e64b0447f5e65032787be6f2
- kind: patch
  path: patches/setuptools/fix-version.patch
