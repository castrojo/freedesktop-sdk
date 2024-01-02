kind: pyproject

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3-hatchling.bst

sources:
- kind: git_repo
  url: github:hynek/hatch-fancy-pypi-readme.git
  track: '*.*.*'
  exclude:
  - '*dev*'
  ref: 24.1.0-0-gc340dcb0019cae8444fd390929f88ee647ac840d
