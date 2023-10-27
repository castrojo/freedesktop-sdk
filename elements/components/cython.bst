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
  ref: 0.29.36-0-g702bbc80fe2e346c4ddc58f074e0054da56e0ced
