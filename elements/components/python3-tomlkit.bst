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
  ref: 0.13.2-0-ge6e5d3803ba2942c5e19e3c083d289009c27338c
