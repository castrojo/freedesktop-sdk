kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python/typing_extensions.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  - '*a*'
  ref: 4.14.0-0-gb07d24525615ba9377e47aaf5a26650a2517b2c4
