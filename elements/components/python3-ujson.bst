kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:esnme/ultrajson.git
  track: '*.*.*'
  ref: 5.8.0-0-g7ce19144fdcff1068e253f3cb9b6343a464a65c7
