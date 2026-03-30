kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:python-poetry/poetry-core.git
  track: '*.*.*'
  ref: 2.3.2-0-g23bf0ac6b8a50a0756ef4d657d8ff67aef88aa67
