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
  ref: 3.2.5-0-gdbbd53ad1cd0ab31ae2a8fee5a64a718788b63fb
