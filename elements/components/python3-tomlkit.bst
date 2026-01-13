kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python-poetry/tomlkit.git
  track: "*.*.*"
  ref: 0.14.0-0-g090a28e46b58473210a74ec68a3c08b1535ff233
