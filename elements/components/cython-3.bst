kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cython/cython.git
  track: '*.*.*'
  ref-format: git-describe
  ref: 3.0.7-0-gf17009c232d0cb5f68cb279bc16d6764e9576426
