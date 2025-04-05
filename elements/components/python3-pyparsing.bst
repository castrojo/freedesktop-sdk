kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pyparsing/pyparsing.git
  track: "*.*.*"
  exclude:
  - "*b*"
  - "*rc*"
  - "*docs*"
  ref: 3.2.3-0-g4dace945ce8cd7211c5d935b6d7be21c86cad8da
