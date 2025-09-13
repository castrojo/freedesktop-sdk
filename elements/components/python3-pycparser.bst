kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pycparser.git
  track: release_v*
  ref: release_v2.23-0-g5b60167602e7914139b3e277266ccdff5c24dbf2
