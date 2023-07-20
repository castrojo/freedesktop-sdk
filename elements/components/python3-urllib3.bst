kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst


depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:urllib3/urllib3.git
  track: '*.*.*'
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 2.0.4-0-gc9fa144545eedb5dc4a2cc3f255e95602a1d7db0
