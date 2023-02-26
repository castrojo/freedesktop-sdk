kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python-poetry/poetry-core.git
  track: '*.*.*'
  ref: 1.5.1-0-g6d73e7eb574dce9ff1eb4bfa0c5dcfa0d96a4ee2
