kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
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
  ref: v1.23.0-0-g3d05d4c25b9924acf49b35fb04355c37ae708a87
