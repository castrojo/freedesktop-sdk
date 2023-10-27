kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:sdispater/tomlkit.git
  track: '*.*.*'
  ref-format: git-describe
  ref: 0.12.2-0-ga1a8d3721dc175faf62b891d9e1e68aaae4052ab
