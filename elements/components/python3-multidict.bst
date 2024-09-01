kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/multidict.git
  track: v*
  exclude:
  - "*a*"
  ref: v6.0.5-0-ga9b281b2ef4ab25d95d6b268aa88c428e75c3696
