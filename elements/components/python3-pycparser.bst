kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pycparser.git
  track: release_v*
  ref: release_v2.22-0-g129d32ef805d715d90a3b2035b13168c17ca63d2
