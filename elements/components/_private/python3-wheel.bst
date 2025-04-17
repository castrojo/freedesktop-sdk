kind: pyproject

build-depends:
- components/_private/python3-build.bst
- components/_private/python3-flit-core.bst
- components/_private/python3-installer.bst
- components/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/wheel.git
  track: '*.*.*'
  ref: 0.46.3-0-g8b6fa740a7101edacb42b0f8e83a1b659ff61033
