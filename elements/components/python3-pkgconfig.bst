kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:matze/pkgconfig.git
  track: v*
  ref: v1.6.0-0-g463480d0a0af629fed927b89ddcf2d406b22e337
