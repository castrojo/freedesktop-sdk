kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cpburnz/python-pathspec.git
  track: v*
  ref: v1.0.1-0-g75f4d0672305dfe3d0a6f182b870c3edec29f316
