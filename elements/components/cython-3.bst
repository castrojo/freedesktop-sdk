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
  ref: 3.0.8-0-ga1b79a6bc5326406ad73af73f5b41e3bb5f8da6e
