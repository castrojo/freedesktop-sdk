kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:cpburnz/python-pathspec.git
  track: v*
  ref: v0.12.1-0-g6485791e1b5cf2ef4e756ae392fa80f2c5045d4c
