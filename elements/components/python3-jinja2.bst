kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pallets/jinja.git
  track: "*.*.*"
  exclude:
  - "*.*.x"
  ref: 3.1.5-0-g877f6e51be8e1765b06d911cfaa9033775f051d1
