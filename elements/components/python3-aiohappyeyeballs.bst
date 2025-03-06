kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/aiohappyeyeballs.git
  track: v*
  ref: v2.5.0-0-g3fed4432036740392483608a9da86637cf1bd64b
