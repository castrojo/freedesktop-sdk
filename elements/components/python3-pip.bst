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
  ref: 26.0-0-g2f4d4a836ed00076001376fbb0ce6dc4f22cdae2
