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
  ref: 22.8.0-0-g46183453fee28329fc09166a34a59548c35d3433
