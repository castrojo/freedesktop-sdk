kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-fancy-pypi-readme.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python-attrs/attrs.git
  track: '*.*.*'
  ref: 24.2.0-0-g6771a04893780166e4b7826b63599f43ac30d00a
