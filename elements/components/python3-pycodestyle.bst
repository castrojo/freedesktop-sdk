kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:PyCQA/pycodestyle.git
  track: '*.*.*'
  ref: '2.11.1-0-gcefd59cf8e8a199a978da491e75a37fe4d37de82'
