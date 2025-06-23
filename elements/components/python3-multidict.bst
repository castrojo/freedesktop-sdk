kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/cython.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/multidict.git
  track: v*
  exclude:
  - "*a*"
  ref: v6.7.1-0-g39d3c322f6a9e824beee9b6f178e3166205f0f59
