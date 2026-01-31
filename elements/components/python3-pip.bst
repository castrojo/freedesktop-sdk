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
  ref: 26.0-0-g2f4d4a836ed00076001376fbb0ce6dc4f22cdae2
