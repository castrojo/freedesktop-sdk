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
  ref: 8.2.0-0-g219206a18666624072fdbb803901e5eb7ce575a1
