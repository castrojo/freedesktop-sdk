kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

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
  ref-format: git-describe
  ref: 3.2.4-0-g21bda420d583bcf464fb9efb932b09c5f3db1efd
