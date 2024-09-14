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
  ref: 3.1.4-0-gb846e4a71416dbf2d801bfe1859aa8e3f3afbe47
