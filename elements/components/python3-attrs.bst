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
  ref: 23.1.0-0-g1e2f6f9cac5cc60f0adab051c14adf09ffe39155
