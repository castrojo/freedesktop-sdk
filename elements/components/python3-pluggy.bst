kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pytest-dev/pluggy.git
  track: "*.*.*"
  exclude:
  - "*dev*"
  ref: 1.6.0-0-gfd08ab5f811a9b2fa9124ae8cbbd393221151e2c
