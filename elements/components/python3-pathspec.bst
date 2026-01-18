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
  ref: v1.0.3-0-gdb3f54e78f68824f641b186bf4a749d944e2153f
