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
  ref: networkx-3.3-0-g7fdddfa2caa8275f7862c46524b803db99ff2cde
