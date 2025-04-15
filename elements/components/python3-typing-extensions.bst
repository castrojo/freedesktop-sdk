kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:python/typing_extensions.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  - '*a*'
  ref: 4.13.2-0-g4525e9dbbd177b4ef8a84f55ff5fe127582a071d
