kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pallets/click.git
  track: 8.*
  exclude:
  - '8.2.2'
  ref: 8.3.0-0-g00fadb8904387158ce6e9aa1573be770446895c1
