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
  ref: v82.0.0-0-g03f3615362c4eb19c770b71be5bd58e38f235528
