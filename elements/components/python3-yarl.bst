kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-expandvars.bst

runtime-depends:
- components/python3.bst
- components/python3-idna.bst
- components/python3-multidict.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: git_repo
  url: github:aio-libs/yarl.git
  track: v*
  ref: v1.11.0-0-g1bd09379a9bf7f82a9db49c9520e4c5d3f7b800e
