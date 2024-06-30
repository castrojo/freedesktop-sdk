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
  ref: 2.2.2-0-g27e2a5c5a7ab6a517252cc8dcef3ffa6ffb8f61a
