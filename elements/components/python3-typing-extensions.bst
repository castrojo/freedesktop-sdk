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
  ref: 4.7.0-0-g633d2e2942372848d8d7859cf71a569259dba9ee
