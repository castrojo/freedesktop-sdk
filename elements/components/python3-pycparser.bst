kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pycparser.git
  track: release_v*
  ref: release_v3.01-0-g7c52c452cd66bcd8683ca336844c64b876d21c3a
