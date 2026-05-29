kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:kjd/idna.git
  track: v*
  ref: v3.17-0-gf48619c4cea6859b938d560fdd9feb898e678567
