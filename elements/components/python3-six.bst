kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:benjaminp/six.git
  track: "*.*.*"
  ref: 1.16.0-0-g65486e4383f9f411da95937451205d3c7b61b9e1
