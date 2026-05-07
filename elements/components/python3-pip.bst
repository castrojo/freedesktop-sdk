kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-wheel.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/pip.git
  track: "*"
  exclude:
  - "*b*"
  ref: 26.1.1-0-g4432a371c6471e6a93c3eb39b3e9ab2b876b13b9
