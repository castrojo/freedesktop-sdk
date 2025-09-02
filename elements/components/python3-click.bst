kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pallets/click.git
  track: 8.*
  exclude:
  - '8.2.2'
  ref: 8.2.1-0-gfd183b2ced1cb5857784fe7fb22f4982f671f098
