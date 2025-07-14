kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

sources:
- kind: git_repo
  url: github:sayanarijit/expandvars.git
  track: v*
  ref: v1.1.1-0-gb128b97573f4d70f0b1812a3ad8dc3d3c23416d1
