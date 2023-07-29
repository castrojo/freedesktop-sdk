kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pyelftools
  track: 'v*.*'
  ref: v0.29-0-g15f032b22a9b870b66d3238822724addda643ca3
