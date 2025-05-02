kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3-hatchling.bst

sources:
- kind: git_repo
  url: github:hynek/hatch-fancy-pypi-readme.git
  track: '*.*.*'
  exclude:
  - '*dev*'
  ref: 25.1.0-0-g8d7b82ce008390d7725c32e064aed8be26ab1cac
