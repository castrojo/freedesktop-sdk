kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cython/cython.git
  track: '0.29.*'
  ref-format: git-describe
  ref: 0.29.37.1-0-g598be7f9fd253c9e44f051f2235abedc66c022c1
