kind: pyproject

build-depends:
- components/_private/python3-build.bst
- components/_private/python3-installer.bst
- components/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/setuptools.git
  track: v*
  ref: v82.0.0-0-g03f3615362c4eb19c770b71be5bd58e38f235528
