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
  ref: 2.4.0-0-g23ead11e4c3d4ae559af754c981090b76d403fcf
