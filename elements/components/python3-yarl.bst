kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-expandvars.bst

runtime-depends:
- components/python3.bst
- components/python3-idna.bst
- components/python3-multidict.bst
- components/python3-propcache.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: git_repo
  url: github:aio-libs/yarl.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.16.0-0-ga147d2ea743f8cf83798ef8f8d54e564f6765f6e
