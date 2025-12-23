kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pyparsing/pyparsing.git
  track: "*.*.*"
  exclude:
  - "*a*"
  - "*b*"
  - "*rc*"
  - "*docs*"
  ref: 3.3.0-0-ge4895d3d9e79a8ecacc8a8c8fd737aa5147683a5
