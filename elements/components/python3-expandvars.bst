kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:sayanarijit/expandvars.git
  track: v*
  ref: v1.1.2-0-gbfdd3f6cf86934f2c3318dd949676aa382be4a89
