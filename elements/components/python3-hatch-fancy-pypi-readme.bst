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
  ref: 23.2.0-0-g9ec38a247af9c1b55048d4e21d285ab59ac8e096
