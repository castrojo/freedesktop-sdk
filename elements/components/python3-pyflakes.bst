kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:PyCQA/pyflakes.git
  track: '*.*.*'
  ref: '3.2.0-0-g881ed2f00255cb247577adad59d4f05122a5f87a'
