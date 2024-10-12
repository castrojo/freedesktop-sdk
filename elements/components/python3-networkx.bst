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
  ref: networkx-3.4.1-0-gab4d3755f22114a02812e756f036857ab0498493
