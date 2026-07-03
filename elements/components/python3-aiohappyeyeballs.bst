kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/aiohappyeyeballs.git
  track: v*
  ref: v2.7.1-0-g4dfc926e30eea8d24c1a71602d73c0e9a895c191
