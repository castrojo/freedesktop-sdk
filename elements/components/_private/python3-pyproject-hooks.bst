kind: pyproject

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/_private/python3-build-bootstrap.bst
- components/_private/python3-flit-core.bst
- components/_private/python3-installer.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/pyproject-hooks.git
  track: '*.*.*'
  ref: v1.2.0-0-g4b7c6d113fb89b755d762a88712c8a6873cddd47
