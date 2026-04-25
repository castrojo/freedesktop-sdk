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
  ref: 1.4.4-0-g70666a296c2e5bb7451f5a04eef259f6f943d0de

