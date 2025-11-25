kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:networkx/networkx.git
  track: networkx-*
  exclude:
  - "networkx-*rc*"
  - "networkx-*b*"
  ref: networkx-3.6-0-gbb9a6ded1889f182d7a5b76831c389c335d52910
