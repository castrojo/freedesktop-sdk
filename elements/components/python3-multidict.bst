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
  ref: v7.2.1-0-gf50870cb46f0146579a1b9d69eeb3f57776eee63
