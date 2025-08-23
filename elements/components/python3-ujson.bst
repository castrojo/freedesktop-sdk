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
  ref: 5.11.0-0-gc392ae1e0a8acc8a1360e78cb4b8cbe9585524ee
- kind: patch
  path: patches/python3-ujson/setuptools_scm_9.patch
