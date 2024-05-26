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
  ref: 4.12.0-0-gf90a8dc40b60bf43510b8611a07d8cc570544ffe
