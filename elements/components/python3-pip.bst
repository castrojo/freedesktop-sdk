kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

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
  ref: 25.2-0-g2e05cae3da2cfafa6dce58167a25b7dba4bc2a33
