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
  ref: 8.2.2-0-gf7cdff5cfc614f34025d1fc238642be029dca1f3
