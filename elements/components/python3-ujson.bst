kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:esnme/ultrajson.git
  track: '*.*.*'
  ref: 5.12.1-0-g7d9036f4896256ac772fdb45d27d45463efe59cb
- kind: patch
  path: patches/python3-ujson/setuptools_scm_9.patch
