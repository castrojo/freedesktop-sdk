kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-six.bst

sources:
- kind: git_repo
  url: github:dateutil/dateutil
  track: '*.*.*'
  ref: 2.8.2-0-g6b035517571e63b6a63a493740c5506ec1e5da44
