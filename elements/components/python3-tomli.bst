kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:hukkin/tomli.git
  track: "*.*.*"
  ref: 2.0.2-0-g3ec6775b118f2ae030d5b12c90939c7f65668e7e
