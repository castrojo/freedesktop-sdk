kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:PyCQA/pyflakes.git
  track: '*.*.*'
  ref: '3.3.2-0-g78ee5319b390b62c0e881976ed475e2fe650daca'
