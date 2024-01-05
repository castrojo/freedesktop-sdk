kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-mccabe.bst
- components/python3-pycodestyle.bst
- components/python3-pyflakes.bst

sources:
- kind: git_repo
  url: github:PyCQA/flake8.git
  track: '*.*.*'
  ref: '7.0.0-0-g88a4f9b2f48fc44b025a48fa6a8ac7cc89ef70e0'
