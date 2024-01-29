kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pygments/pygments.git
  track: refs/tags/*.*.*
  ref: 2.17.2-0-gee30ce132ae252bd72f3a74c86d9314a2214d0b4
