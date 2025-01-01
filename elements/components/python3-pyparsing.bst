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
  ref: 3.2.1-0-gabb3b4bcfaeaa5e1c83a3af4c1c6c8a03acc7dcd
