kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst


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
  ref: 1.26.15-0-g95ca35211d23d8baf7646e1f60aa31e3650178a8
