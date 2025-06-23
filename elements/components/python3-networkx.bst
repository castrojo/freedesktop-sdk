kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:networkx/networkx.git
  track: networkx-*
  exclude:
  - "networkx-*rc*"
  - "networkx-*b*"
  ref: networkx-3.6.1-0-g7530809bfa1ea7ed6fdf918a4d1431488953cb1f
