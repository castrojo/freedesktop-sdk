kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

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
  ref: v1.9.3-0-g0698dc947772786fcff467b12cfb1f3921c7ff31
