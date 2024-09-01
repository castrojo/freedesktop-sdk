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
  ref: v1.4.1-0-g457b28e247af3df54e3ab946b34e8ef3d12d691d
