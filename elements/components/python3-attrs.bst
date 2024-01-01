kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-vcs.bst
- components/python3-hatch-fancy-pypi-readme.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python-attrs/attrs.git
  track: '*.*.*'
  ref: 23.2.0-0-g9e443b18527dc96b194e92805fa751cbf8434ba9
