kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python/tzdata.git
  track: '*.*.*'
  exclude:
  - '*post*'
  - '*rc*'
  ref: 2026.2-0-g1ed894339a0c37a85f8ba2a7c4d7696934d332dd
