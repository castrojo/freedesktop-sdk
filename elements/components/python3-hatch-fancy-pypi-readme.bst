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
  ref: 23.1.0-0-g0a8c9726910461228592b13d2a186e7605d49e1a
