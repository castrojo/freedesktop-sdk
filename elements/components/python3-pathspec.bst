kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cpburnz/python-pathspec.git
  track: v*
  ref: v1.0.2-0-g0ff66291a073efa3daacb4ccace3ce60420923ba
