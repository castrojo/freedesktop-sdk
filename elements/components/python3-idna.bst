kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:kjd/idna.git
  track: v*
  ref: v3.15-0-gaf30a092e158181d0b35ac66dfa813788126bdd8
