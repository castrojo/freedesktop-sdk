kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
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
  ref: 6.0.4-0-g575f0e87bcc3b95f4df8da4aaddb0bef4e4553fc
