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
  ref: 3.0.9-0-g31d4058ab2bd3c6a6fa25197ef4fc6ac62a2d95b
