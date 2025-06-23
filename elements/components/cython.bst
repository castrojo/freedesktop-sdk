kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cython/cython.git
  track: '*.*.*'
  exclude:
  - "*a*"
  - "*rc*"
  - "*b*"
  ref: 3.2.4-0-g21bda420d583bcf464fb9efb932b09c5f3db1efd
