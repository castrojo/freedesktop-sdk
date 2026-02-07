kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- public-stacks/runtime-minimal.bst
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/setuptools.git
  track: v*
  ref: v81.0.0-0-g049815b259805879f2fd60987f1d9e0d39c9dc96
