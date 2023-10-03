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
  ref: 2.0.6-0-g262e3e332209ee93ff70e2b13502c8f20c105ac8
