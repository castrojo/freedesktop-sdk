kind: pyproject

build-depends:
- components/_private/python3-build-bootstrap.bst
- components/_private/python3-flit-core.bst
- components/_private/python3-installer.bst
- components/_private/python3-minimal.bst

runtime-depends:
- components/_private/python3-packaging.bst
- components/_private/python3-pyproject-hooks.bst
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/build.git
  track: '*.*.*'
  ref: 1.4.0-0-g54f238d1664124e06a68c6c22fd5b1418fa5feb2

