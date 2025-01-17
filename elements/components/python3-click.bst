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
  ref: 8.2.0-0-ge4c24ca309ebe77ab029dac9b6d27d49fff5964f
