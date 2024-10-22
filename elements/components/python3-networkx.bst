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
  ref: networkx-3.4.2-0-g2acf1590f82757c01a57b81b8c5dfb79e60aa416
