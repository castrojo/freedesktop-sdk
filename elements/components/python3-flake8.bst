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
  ref: '6.1.0-0-g7ef0350a439c93166bc8ba89fcc3de6a9a664e6c'
