kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:viraptor/arpy.git
  track: '*.*.*'
  ref: 2.4.0-0-g9bd29c69d20e9d93089f35ddadbb9c49e9a0a5b8
