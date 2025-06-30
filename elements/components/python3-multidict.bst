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
  ref: v6.6.3-0-gdbd686f37c1bc14355dce9c16dbbfae82f11dc00
