kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pfmoore/editables.git
  track: "*.*"
  ref: 0.5-0-g2331418af764ef203959327354335c431978e70d
