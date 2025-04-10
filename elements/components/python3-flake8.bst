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
  ref: '7.2.0-0-g16f5f28a384f0781bebb37a08aa45e65b9526c50'
