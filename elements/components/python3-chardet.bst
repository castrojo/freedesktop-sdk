kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/stripper.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:chardet/chardet.git
  track: "*.*.*"
  ref: 6.0.0-0-g8a4636b1d4ef21d11cc8190f6ff271670b9d20ee
