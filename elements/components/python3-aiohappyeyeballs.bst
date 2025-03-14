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
  ref: v2.6.1-0-ge3bd5bdf44f5d187802de6dcb08d27e1ca6da048
