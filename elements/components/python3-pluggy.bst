kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pytest-dev/pluggy.git
  track: "*.*.*"
  exclude:
  - "*dev*"
  ref: 1.5.0-0-gf8aa4a009716a7994f2f6c1947d9fa69feccbdd5
