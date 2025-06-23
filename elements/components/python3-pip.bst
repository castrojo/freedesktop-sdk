kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

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
  ref: 26.0.1-0-g5fe4ea4f24cd9756316a4b5ef05daa15d84f7d0c
