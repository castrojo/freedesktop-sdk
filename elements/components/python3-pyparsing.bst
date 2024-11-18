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
  ref: 3.2.0-0-g36fc04b780bf4bc41b8ad60a2cfd89528545c38c
