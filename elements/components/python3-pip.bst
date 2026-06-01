kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst

sources:
- kind: git_repo
  url: github:pypa/pip.git
  track: "*"
  exclude:
  - "*b*"
  ref: 26.1.2-0-g31d7d168953668aad85154d6121879d07fbeac27
