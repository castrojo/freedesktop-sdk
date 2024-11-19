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
  ref: v1.17.2-0-g4ab9b12babeb429b36de2276524b2b26e225e4de
