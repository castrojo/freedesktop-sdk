kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-expandvars.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/frozenlist.git
  track: "*.*.*"
  exclude:
  - "*a*"
  ref: v1.6.2-0-g46936c19e09e457932dbb3db264796bba9a36225
