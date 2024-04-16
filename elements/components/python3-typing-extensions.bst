kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python/typing_extensions.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 4.11.0-0-gd4d929d44bd984350e2d17726362295f588eaace
