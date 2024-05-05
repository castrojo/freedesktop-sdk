kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pygments/pygments.git
  track: refs/tags/*.*.*
  ref: 2.18.0-0-gd7d11f6e6d3aa97805215c1cc833ea5f0ef1fcbb
