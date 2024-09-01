kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:kjd/idna.git
  track: v*
  ref: v3.8-0-g784c6f45c162db9709588124f2f1def5b70615ff
