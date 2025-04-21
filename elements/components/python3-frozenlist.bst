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
  ref: v1.6.0-0-g9f4253c6a959af6a81ffc93350861e8a375355bc
