kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/wheel.git
  track: '*.*.*'
  ref: 0.44.0-0-g7bb46d7727e6e89fe56b3c78297b3af2672bbbe2
