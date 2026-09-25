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
  ref: 2.5.0-0-gb52c25c451bbaed9f309d45fc6e6e35c704e55bf
