kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cpburnz/python-pathspec.git
  track: v*
  ref: v1.1.0-0-gc9249c8b4ca165ca8c5eea191cea4c0e6f3aa827
