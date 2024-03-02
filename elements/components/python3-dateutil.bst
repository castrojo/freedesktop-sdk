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
  ref: 2.9.0.post0-0-g1ae807774053c071acc9e7d3d27778fba0a7773e
