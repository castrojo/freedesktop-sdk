kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:python-poetry/tomlkit.git
  track: "*.*.*"
  ref: 0.15.3-0-gd2aa305673a01eafd0edda54ef07ebcb8902f4d4
