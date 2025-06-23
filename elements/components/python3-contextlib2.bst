kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jazzband/contextlib2.git
  track: "*.*.*"
  exclude:
  - "*post*"
  ref: 21.6.0-0-g94174bafebe58a79af6059883f604624ab087d18
