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
  ref: v1.7.0-0-g63cbd49b3df13fcd661ae79e5e2eb66c46a1684a
- kind: patch
  path: patches/python3-frozenlist/reproducible.patch
