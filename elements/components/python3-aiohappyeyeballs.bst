kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:aio-libs/aiohappyeyeballs.git
  track: v*
  ref: v2.4.6-0-gf18ad492a3e9f04bf4c89aa4e85c82e8cd113b58
