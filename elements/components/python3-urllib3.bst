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
  ref: 2.2.0-0-g04df048cf4b1c3790c56e26c659db764aad62d6f
