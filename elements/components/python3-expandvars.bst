kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:sayanarijit/expandvars.git
  track: v*
  ref: v0.12.0-0-ge8c7cf9c37b115d539a84410baa5fb56aa4b85d8
