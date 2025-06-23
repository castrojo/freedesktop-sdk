kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/cython.bst

depends:
- components/python3.bst
- components/libyaml.bst

sources:
- kind: git_repo
  url: github:yaml/pyyaml.git
  track: '*.*.*'
  exclude:
  - "*rc*"
  - "*b*"
  ref: 6.0.3-0-g49790e73684bebad1df05ef8d828fa12f685bffb
