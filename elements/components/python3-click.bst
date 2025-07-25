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
  ref: 8.2.2-0-gdf8a52ed8073b2a253ff4511eedc27b512264bf7
