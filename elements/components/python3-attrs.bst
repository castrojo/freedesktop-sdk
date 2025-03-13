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
  ref: 25.2.0-0-g19943b775d40c018e844f2cb1728442f58112a3b
