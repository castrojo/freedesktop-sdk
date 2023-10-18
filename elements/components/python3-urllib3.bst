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
  ref: 2.0.7-0-g56f01e088dc006c03d4ee6ea9da4ab810f1ed700
