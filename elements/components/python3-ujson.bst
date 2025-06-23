kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:esnme/ultrajson.git
  track: '*.*.*'
  ref: 5.12.0-0-g4baeb950df780092bd3c89fc702a868e99a3a1d2
- kind: patch
  path: patches/python3-ujson/setuptools_scm_9.patch
