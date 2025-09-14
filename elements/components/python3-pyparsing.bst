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
  - "*b*"
  - "*rc*"
  - "*docs*"
  ref: 3.2.4-0-g57923cd6a651d81c72b4e60b2baa02fbedf217ba
