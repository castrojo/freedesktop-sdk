kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3-packaging.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/pyproject-metadata.git
  track: "*.*.*"
  exclude:
  - "*rc*"
  - "*b*"
  ref: 0.11.0-0-g7c346cf35ef116c6ee634951191b09695aec4d83
